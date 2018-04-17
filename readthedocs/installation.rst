============
Installation
============

Soneti's installation is quite easy and in a few steps you can have the toolkit installed and ready to use.
First of all it is necessary to clone the GitLab repository:

.. sourcecode:: bash

    $ git clone http://lab.cluster.gsi.dit.upm.es/social/soneti.git
    $ cd soneti
    $ git submodule update --init --recursive

Now images are ready to run:

.. sourcecode:: bash

    $ docker-compose up --build

Check Senpy service is working on http://localhost:8000, GSICrawler service is working on http://localhost:5000 and Sefarad is working on http://localhost:8080

Also is necessary to initialize Fuseki dataset in order to be able to store some data. Browse to http://localhost:3030/manage.html?tab=new-dataset. User and password required are admin and fusekisoneti respectively.

Name the dataset default and select Persistent option. Click on create dataset button.

Now your Soneti toolkit is ready to work.

