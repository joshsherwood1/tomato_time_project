# Tomato Time Trivia

<img width="989" alt="Screen Shot 2019-10-30 at 6 27 12 PM" src="https://user-images.githubusercontent.com/33855435/67908976-1f6b0a00-fb43-11e9-844d-d3552f6afac5.png">

# About

Welcome!

You have stumbled upon our Triva Game called 'Tomato Time'. This is a Turing School of Software and Design project that was completed during Module 3 of the backend engineering program. Utilizing Sinatra, Rails and TDB API, we have engineered a platform to test your trivia skills in the form of an interactive web application.

Try our App!
https://peaceful-chamber-62417.herokuapp.com/

# How it works

To consume an external trivia API we used services in a Sinatra application. The data consumed from this API is converted into stored question objects. We built a Rails app that consumes an internal API of the [Sinatra app](https://tomato-time-api.herokuapp.com/), which accesses these stored question objects via spefic endpoints. The Rails appilcation then uses its own services to render a game in the browser, styled with bootstrap. 

<img width="801" alt="Screen Shot 2019-10-23 at 2 49 52 PM" src="https://user-images.githubusercontent.com/33855435/67909323-6c031500-fb44-11e9-85ef-8b989a26e8ef.png">

# Local Installation

  ## Requirements
      - Ruby 2.4.1
      Required Gems:
        gem 'bootsnap', '>= 1.1.0', require: false
        gem 'omniauth-google-oauth2'
        gem 'figaro'
        gem 'faraday'
        gem 'sidekiq'
        gem 'sinatra'
 # Clone
    '''
    $ git clone https://github.com/joshsherwood1/tomato_time_project.git
    $ cd tomato_time_project
    $ bundle
    '''
# Setup Database
    '''
    $ rails db:{drop,create,migrate,seed}
    '''

# Testing
    Integration testing and Unit testing is implemented with RSpec and can be run with $ bundle exec rspec

# Performance
    We are using Skylight to track app performance, use the buttons below to checkout our stats on Skylight.io
[![View performance data on Skylight](https://badges.skylight.io/problem/q5G0EIYttyKf.svg?token=WqHiMzJUAr5sxcZd2A9NgUW7ufBbQFHTTFzaF-FWkB8)](https://www.skylight.io/app/applications/q5G0EIYttyKf)
    [![View performance data on Skylight](https://badges.skylight.io/typical/q5G0EIYttyKf.svg?token=WqHiMzJUAr5sxcZd2A9NgUW7ufBbQFHTTFzaF-FWkB8)](https://www.skylight.io/app/applications/q5G0EIYttyKf)
    [![View performance data on Skylight](https://badges.skylight.io/rpm/q5G0EIYttyKf.svg?token=WqHiMzJUAr5sxcZd2A9NgUW7ufBbQFHTTFzaF-FWkB8)](https://www.skylight.io/app/applications/q5G0EIYttyKf)
    [![View performance data on Skylight](https://badges.skylight.io/status/q5G0EIYttyKf.svg?token=WqHiMzJUAr5sxcZd2A9NgUW7ufBbQFHTTFzaF-FWkB8)](https://www.skylight.io/app/applications/q5G0EIYttyKf)
    
    
  # Development Team
    
<img width="150" height="150" alt="Screen Shot 2019-10-30 at 10 09 25 PM" src="https://user-images.githubusercontent.com/33855435/67918475-21909100-fb62-11e9-88be-f2fa30715580.png">
https://github.com/MackHalliday

<img width="150" height="150"  alt="Screen Shot 2019-10-30 at 10 09 42 PM" src="https://user-images.githubusercontent.com/33855435/67918498-3b31d880-fb62-11e9-86ce-00b06f82f749.png">
https://github.com/nancylee713

<img width="150" height="150"  alt="Screen Shot 2019-10-30 at 10 09 10 PM" src="https://user-images.githubusercontent.com/33855435/67918514-4b49b800-fb62-11e9-99b2-4a3bdf21a3a7.png">
https://github.com/joshsherwood1

<img width="150" height="150"  alt="Screen Shot 2019-10-30 at 10 09 00 PM" src="https://user-images.githubusercontent.com/33855435/67918529-556bb680-fb62-11e9-9a8f-1fbb49d239ea.png">
https://github.com/scottzero

