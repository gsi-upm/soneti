=========
Use cases
=========

In this documentation we are going to show some uses of Soneti toolkit using the orchestrator.

First of all, you need to create a python script named `orchestrator.py` on root folder and add our dependencies:

.. sourcecode:: python

    import luigi
    from luigi.contrib.esindex import CopyToIndex
    from orchestrator.SenpyAnalysis import SenpyAnalysis
    from orchestrator.GSICrawlerScraper import GSICrawlerScraper
    from orchestrator.CopyToFuseki import CopyToFuseki

Use case 1: Use GSICrawler to get some news
-------------------------------------------

This use case is going to retrieve the latest news on CNN newspaper about Trump, for doing so is necessary to add some lines to our python script created before:

.. sourcecode:: python 

    class ScrapyTask(GSICrawlerScraper):
        query = luigi.Parameter()
        id = luigi.Parameter()
        number = luigi.Parameter()
        source = luigi.Parameter()
        host = 'http://gsicrawler:5000/api/v1'

        def output(self):
            return luigi.LocalTarget(path='/tmp/_scrapy-%s.json' % self.id)

As shown in the code we select as endpoint our GSICrawler service and other parameters are going to be given by command line.

Run the orchestrator:

.. sourcecode:: bash 

	$ docker-compose exec orchestrator python -m luigi --module orchestrator ScrapyTask --query Trump --number 10 --source cnn --id 1


Use case 2: Use GSICrawler to get some tweets, and analyse sentiments with Senpy
--------------------------------------------------------------------------------

This use case improve the use case 1 adding analysis with Senpy. In addition, we change the data source from CNN newspaper to Twitter. Modify the python script adding this lines:

.. sourcecode:: python 

    class AnalysisTask(SenpyAnalysis):

       query = luigi.Parameter()
       id = luigi.Parameter()
       number =luigi.Parameter()
       source = luigi.Parameter()

       host = 'http://senpy:5000/api/'
     
       algorithm = 'sentiment140'
     
       lang = 'en'
     
       def requires(self):
           return ScrapyTask(self.id,self.query,self.number,self.source)
     
       def output(self):
           return luigi.LocalTarget(path='/tmp/analysed%s.json'%self.id)

As shown in the code we select as endpoint our Senpy service and other parameters are going to be given by command line.

Run again the orchestrator:

.. sourcecode:: bash 

	$ docker-compose exec orchestrator python -m luigi --module orchestrator AnalysisTask --query Trump --number 10 --source twitter --id 2

Use case 3: Use GSICrawler to get some tweets, analyse sentiments with Senpy and store results on Fuseki and Elasticsearch
--------------------------------------------------------------------------------------------------------------------------

This use case improve use case 2 adding a persistence layer to store results. Modify the python script adding this lines:

.. sourcecode:: python 

    class FusekiTask(CopyToFuseki):
        
        id = luigi.Parameter()
        query = luigi.Parameter()
        number = luigi.Parameter()
        source = luigi.Parameter()
        host = 'fuseki'
        port = 3030

        def requires(self):
            return AnalysisTask(self.id,self.query,self.number,self.source)
            
        def output(self):
            return luigi.LocalTarget(path='/tmp/_n3-%s.json' % self.id)

    class ElasticsearchTask(CopyToIndex):
        
        id = luigi.Parameter()
        query = luigi.Parameter()
        number = luigi.Parameter()
        source = luigi.Parameter()
        index = 'soneti'
        doc_type = 'news'
        host = 'elasticsearch'
        port = 9200
        timeout = 100

        def requires(self):
            return AnalysisTask(self.id,self.query,self.number,self.source)

    class StoreTask(luigi.Task):

        id = luigi.Parameter()
        query = luigi.Parameter()
        number = luigi.Parameter()
        source = luigi.Parameter()

        def requires(self):
            yield FusekiTask(self.id, self.query, self.number)
            yield Elasticsearch(self.id, self.query, self.number)

Run again the orchestrator:

.. sourcecode:: bash 
	
	$ docker-compose exec orchestrator python -m luigi --module GSICrawler StoreTask --query Trump --number 10 --source cnn --id 3

Now your data is available on elasticsearch and fuseki.