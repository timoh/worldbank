Worldbank README
=============

This application is meant to act as a cache and reformatting layer between the World Bank's open API's and a simple visualization tools that suffer from lack of mature JSON formatting tools.

This app has been deployed to http://worldbank.herokuapp.com/

The three API's supported for the current purpose of the project are

* Death Rate (http://data.worldbank.org/indicator/SP.DYN.CDRT.IN)

* Birth Rate (http://data.worldbank.org/indicator/SP.DYN.CBRT.IN)

* GDP per capita in current USD (http://data.worldbank.org/indicator/NY.GDP.PCAP.CD)

This app has been tested to work January 17th, 2015 on Heroku and MongoLab with Ruby version 2.0.0.

The app uses following additional components to normal Rails 4 gems:

* mongoid 4 (ORM)
* oj (JSON parser)