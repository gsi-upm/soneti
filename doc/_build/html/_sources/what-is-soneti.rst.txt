==============
What is Soneti
==============

**Soneti** is a toolkit for **analyzing social software**, such as social networks (e.g. Twitter, Facebook, ...), blogs, YouTube, AppStores, etc.. 

Its purpose is to provide tools to carry out automatic analysis about the contents and the users of this social software. Some of the applications we have developed are sentiment and emotion analysis for brand monitoring, radicalism analysis, personality analysis of youtubers, to name a few.


.. figure:: figures/gsi-social-network-analysis.jpg
   :scale: 80%
   :alt: Soneti overview

Someti is structured into four blocks:

* **Ingestion tools:** tools for aggregating information from social networks. Two approaches can be followed using an API (e.g. Twitter, Facebook or Logstash) or Scraping (e.g. GSICrawler and Scrappy). 
* **Social Software Analysis:** tools for analysing the incoming information. The core of this tools is a workflow engine (**Luigi**) which orchestrates the data pipelines, from ingestion to analysis and storing. The information is usually analyzed with **Senpy** and stored in **ElasticSearch**.
* **Social Simulation:** tools for simulating the behaviour of social networks. The tool **Soil** provides an agent-based simulator based on **NetworkX**.
* **Query & Visualization**: tools for visualuazing and querying the results. We provide **Sefarad**, which enables the development of dashboards and includes a semantic query interface. In addition, **Kibana** can be used for visual analytics.