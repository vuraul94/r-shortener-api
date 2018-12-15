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

    3-Initialize and commit changes in repository

    4-Add postgresql plugin to heroku project

    5-execute the command "heroku rails db:migrate"

    6-execute the command "git push heroku master"

* Algorithm explanation

-Shortening

    Initial Url (String) ->  Add time to the initial url -> encode to md5 -> Get the first 7 characters

-Save

-Get Title in job

    Get body of page -> get title tag -> update


*Endpoints

-100 more visited
>GET https://r-shortener-api.herokuapp.com/

-url data get
>GET https://r-shortener-api.herokuapp.com/?url=https://google.com

-url redirect 
>GET https://r-shortener-api.herokuapp.com/e933dbe

-create shortening 
>POST https://r-shortener-api.herokuapp.com/
>
>{
> "url": "https://www.facebook.com"   
>}