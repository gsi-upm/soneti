#!/bin/sh
curl -XPUT http://localhost:9200/somedi/_mapping/texts?update_all_types -d '
{
  "properties": {
    "schema:articleBody": { 
      "type": "text",
      "fielddata": true
    }
  }
}'

curl -XPUT http://localhost:9200/somedi -d '
{
    "settings": {
        "analysis": {
            "filter": {
                "my_stop": {
                    "type":       "stop",
                    "stopwords":  "_english_"
                }
            }
        }
    }
}'
