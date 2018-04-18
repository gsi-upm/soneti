import luigi
from luigi.contrib.esindex import CopyToIndex
from orchestrator.SenpyAnalysis import SenpyAnalysis
from orchestrator.GSICrawlerScraper import GSICrawlerScraper
from orchestrator.CopyToFuseki import CopyToFuseki


class ScrapyTask(GSICrawlerScraper):

    id = luigi.Parameter()
    query = luigi.Parameter()
    number = luigi.Parameter()
    source = luigi.Parameter()
    host = 'http://gsicrawler:5000/api/v1'

    def output(self):
        return luigi.LocalTarget(path='/tmp/_scrapy-%s.json' % self.id)


class AnalysisTask(SenpyAnalysis):

    id = luigi.Parameter()
    query = luigi.Parameter()
    number =luigi.Parameter()
    source = luigi.Parameter()
    host = 'http://senpy:5000/api/'
    algorithm = luigi.Parameter()
    lang = luigi.Parameter()
     
    def requires(self):
        return ScrapyTask(self.id,self.query,self.number,self.source)
     
    def output(self):
        return luigi.LocalTarget(path='/tmp/analysed%s.json'%self.id)

class FusekiTask(CopyToFuseki):
    
    id = luigi.Parameter()
    query = luigi.Parameter()
    number = luigi.Parameter()
    source = luigi.Parameter()
    algorithm = luigi.Parameter()
    lang = luigi.Parameter()
    host = 'fuseki'
    port = 3030

    def requires(self):
        return AnalysisTask(self.id,self.query,self.number,self.source,self.algorithm,self.lang)
        
    def output(self):
        return luigi.LocalTarget(path='/tmp/_n3-%s.json' % self.id)

class ElasticsearchTask(CopyToIndex):
    
    id = luigi.Parameter()
    query = luigi.Parameter()
    number = luigi.Parameter()
    source = luigi.Parameter()
    algorithm = luigi.Parameter()
    lang = luigi.Parameter()
    index = 'somedi'
    doc_type = 'lateral'
    host = 'elasticsearch'
    port = 9200
    timeout = 100

    def requires(self):
        return AnalysisTask(self.id,self.query,self.number,self.source,self.algorithm,self.lang)

class StoreTask(luigi.Task):

    id = luigi.Parameter()
    query = luigi.Parameter()
    number = luigi.Parameter()
    source = luigi.Parameter()
    algorithm = luigi.Parameter()
    lang = luigi.Parameter()

    def requires(self):
        yield FusekiTask(self.id, self.query, self.number, self.source, self.algorithm,self.lang)
        yield ElasticsearchTask(self.id, self.query, self.number, self.source, self.algorithm,self.lang)