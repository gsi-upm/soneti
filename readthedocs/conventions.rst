===========
Conventions
===========

Elastic Search
--------------

We will use one index per demo/dashboard/use case, and doc types to differentiate content type (e.g., posts from comments).

To allow different sources in a dashboard (e.g. posts from `elpais.com` and `elmundo.es`), we will use a field named `source` and use the FQDN of the source (e.g. `http://elpais.com`).


Formats
-------

In this section we will cover the main categories of social content and how to format them.
Each category includes examples of annotation for specific cases.

Once these formats are stable, we will create an ontology and/or schema for them.

Whenever possible, we will adhere to existing ontologies and standards (e.g., [SIOC](http://sioc-project.org/) and [FOAF](http://xmlns.com/foaf/spec/)).

Posts
+++++

Posts are self-contained pieces of content that typically include:

 * sioc:id
 * dcterms:title
 * sioc:link
 * sioc:links_to
 * sioc:has_creator
 * sioc:has_container
 * sioc:has_space
 * sioc:topic (can be used to add tags or categories)
 * sioc:has_reply
 * sioc:content
 * sioc:attachment
 * sioc:num_views
 * sioc:content

Ideally, we will align with [SIOC](http://rdfs.org/sioc/spec/).


Example: Blog post
******************

Example: Newspaper
******************

Example: Reddit
***************

Microblogging
+++++++++++++

Example: Twitter
****************

```
```

Comments
++++++++


Example: Reddit
***************

Social networks (relationships)
+++++++++++++++++++++++++++++++
See [FOAF](http://xmlns.com/foaf/spec/).

Sentiment & Emotion
+++++++++++++++++++
