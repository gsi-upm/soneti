===============
What is Soneti?
===============

**Soneti** is a toolkit for **analyzing social software**, such as social networks (e.g. Twitter, Facebook, ...), blogs, YouTube, Newspapers, AppStores, etc.. 

It obtains data from diffetent sources, in addition it enrich this obtained data by performing different types of automatic analysis. Finally, it allows us to visualize the data obtained in interactive dashboards.

Some of the applications we have developed are sentiment and emotion analysis for brand monitoring, radicalism analysis, personality analysis of youtubers, to name a few.




Architecture
~~~~~~~~~~~~

Soneti has a modular architecture and we differentiate three main modules, as we can see in the image.

.. figure:: figures/soneti.png
   :alt: Soneti overview

* **Ingestion tool:** This module is called **GSICrawler** and is responsible for obtaining data from different sources, whether they are newspapers or social networks. For more information about this module or to add new data sources visit the documentation on http://gsicrawler.readthedocs.io

* **Social Software Analysis:** tools for data enrichment. This module uses **Senpy**: an analysis service, it allows us to obtain the sentiments, emotions or detect entities present in a certain text. To obtain more information about Senpy or to add new plugins for analysis visit the documentation on http://senpy.readthedocs.io

* **Query & Visualization**: tools for visualuazing and querying the results. We provide **Sefarad**, which enables the development of dashboards and includes a semantic query interface. It is based on Web Components and allows us to obtain an interactive overview of the data collected and enriched through the previous modules. Soneti provides a predefined dashboard if you are interested in getting more information and creating your own dashboards visit the Sefarad's documentation on http://sefarad.readthedocs.io

Above all these modules we find the orchestrator Luigi, who is in charge of coordinating and establishing the relationships between all the modules.