# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 

    ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]

* Configuration 

    gems installed (nokogiri, httparty)

* Database initialization 

    rails db:migrate

* How to run the test suite

    rails s

* Services (job queues, cache servers, search engines, etc.)
    
    ShortUrlTitlesJob

* Deployment instructions

    1-Install heroku client
    2-execute the command "heroku login"

* Algorithm explanation

-Shortening

    Initial Url (String) ->  Add time to the initial url -> encode to md5 -> Get the first 7 characters

-Save

-Get Title in job

    Get body of page -> get title tag -> update
