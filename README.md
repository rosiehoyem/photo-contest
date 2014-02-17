== README

* Ruby version: 2.0.0, Rails version 4.0.2

* Configuration
To create a new contest, contact the API administrator for a unique key. This is the only required parameter for initializing a new tournament.

I've treated the API key as non-sensative data. If it identified as a security concern, I would have put it in a .yml file, hid it from GitHub in the `.gitignore` file, and referenced through the configs.

* Database:
This app utilizes Postgres in the development, testing, and production environments. 

* Test Suite:
I've started to create a test suite utilizing Rsec, Capybara, and Selenium. I've also included the gems for database_cleaner, factory_girl, guard, and simplecov. 

To run on tests on a local copy of this repository, navigate to the root directory and enter `rspec` on the command line.

Simple cov produces a code coverage report that can be found in `coverage` folder in the root directory. Open `room/coverage/index.html` for test coverage percentages. 

I've created some model specs. Next I would create specs to check the Http responses and some feature specs.

* Deployment instructions
Application is currently deployed on Heroku: 

* Issues

1. The application breaks when trying to submit the first round of winners. I ran into an issue with submitting the form for choosing a winner in Round 1.
Error Message
`ActionController::ParameterMissing at /contests/1/rounds/1/images/wins
param not found: image`

It is a strong params issue, but my efforts today failed come up with a solution. I think it must have to do with how I've nested my models. If I had more time, I'd dig deeper there. 

2. I also ran into some issues setting up the payload for submitting the `post` round request. I tried using both the Net::HTTP ruby library and HTTParty. Following [this example](http://stackoverflow.com/questions/3586616/help-me-with-posting-with-nethttp), I was getting this error: 
"NoMethodError: undefined method `bytesize' for #<Array:0x007f97e58f1a18>"

In my application, I have a set-up methods in the `Round` model.

Most of the structure of the app should be in place. Unfortunately, these two issues kept me from creating a working version. 

