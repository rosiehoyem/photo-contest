#README

##Overview: 

* This is a tournament-style application for choosing a winning photograph out of a pool of 16 photographs. Users inialize a tournament with a unique API key and move through four rounds of choosing winners from pairs of photos to arrive at one grand champion photo.

#Application Details: 

* Ruby version: 2.0.0, Rails version 4.0.2, see the Gemfile for a full list of dependencies

* Database: This app utilizes Postgres in the development, testing, and production environments. 

* Architecture: The application design follows object-oriented methodologies with three models.

* Web Service: The application is built around a web service located at: [http://pv.pop.umn.edu/](http://pv.pop.umn.edu/). The webservice to utilized at several moments throughout the tourament: 1. Contest initialization, 2. Retrieving the data for each round, 3. Reporting the results of each round’s voting, and 4. Contest completion.

* Testing Tools: I've started to create a test suite utilizing Rsec, Capybara, and Selenium. I've also included the gems for database_cleaner, factory_girl, guard, webmock, vcr, turn, and simplecov. To run on tests on a local copy of this repository, navigate to the root directory and enter `rspec` on the command line. 

* Test Coverage: I've created some model specs. Next I would create specs to check the Http responses and some feature specs. Simple cov produces a code coverage report that can be found in `coverage` folder in the root directory. Open `room/coverage/index.html` for test coverage percentages. 

* Deployment: The application is currently deployed on Heroku: http://polar-basin-4663.herokuapp.com/

* Set-up: To create a new contest, contact the API administrator for a unique api-key. This is the only required parameter for initializing a new tournament. I've treated the API key as non-sensative data. If it were identified as a security concern, I would put it in a `.yml` file, hide it from GitHub in the `.gitignore` file, and reference it through the configs. I'd use Heroku's config variables to include it in production.

* Front end: [Bootstrap](http://getbootstrap.com/) and [Bootswatch](http://bootswatch.com/) theme were used to styalize the front end and provide some light interactivity.

##Issues to resolve:

1. The application breaks (ungracefully) when trying to submit the first round of winners. I ran into an issue with submitting the form for choosing a winner in Round 1.
Error Message
`ActionController::ParameterMissing at /contests/1/rounds/1/images/wins
param not found: image`

It is a strong params issue, but my efforts today failed to come up with a solution. I think it must have to do with how I've nested my models. If I had more time, I'd dig deeper there. 

2. I also ran into some issues setting up the payload for submitting the `post` round request. I tried using both the Net::HTTP ruby library and HTTParty. Following [this example](http://stackoverflow.com/questions/3586616/help-me-with-posting-with-nethttp), I was getting this error: 
`NoMethodError: undefined method 'bytesize' for #<Array:0x007f97e58f1a18>`

In my application, I have a set-up methods in the `Round` model using HTTParty to do this post request. I think it is close.

Most of the structure of the app, API call methods, views, and routes are in place. Unfortunately, these two issues kept me from creating a fully working version of this application. 

##Next steps and additional features:
1. After resolving the issues above, I'd include better handling of errors and incorporate status checks at points in the app.

2. Better test coverage.

3. Tag feature.

4. A virtual photo gallery of all tournament winners.


