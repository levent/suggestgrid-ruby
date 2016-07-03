# [ SuggestGrid Ruby Client ]( http://www.github.com/suggestgrid/suggestgrid-ruby )
*Version 0.1.15-SNAPSHOT*

Ruby is a first class citizen at [SuggestGrid](http://www.suggestgrid.com) with its curated client!
Every endpoint of [SuggestGrid REST API](http://www.suggestgrid.com/docs/api) is available on SuggestGrid Ruby Client.

We will walk through how to get started with SuggestGrid Ruby Client in three steps:
 1. [Configure the client](#1-configure-the-client)
 2. [Post actions](#2-post-actions)
 3. [Get recommendations](#3-get-recommendations)

If you did not [sign up for SuggestGrid](https://lcars.herokuapp.com/users/sign_up), this is the right time.


## Getting Started with SuggestGrid Ruby Client
In this guide we will demonstrate how to display personalized recommendations on an existing Ruby project.

We have a movie catalog Ruby application, SuggestGridMovies, similar to IMDb.
For logged in users we want to display movies that *similar people viewed* on movie pages.
Let's implement this feature in five minutes with SuggestGrid!

We are beginning the development by adding the client as a dependency:

```ruby
gem 'suggest_grid', git: 'https://github.com/suggestgrid/suggestgrid-ruby.git'
```


### 1. Configure the client
Applications make their API requests to their dedicated sub-domain of `suggestgrid.space`.
Most endpoints require a username and password for authentication.
An initial user name and password is given on sign up or after Heroku provisioning.

It is very convenient to configure SuggestGrid by setting an authenticated `SUGGESTGRID_URL` environment variable in the format below:

`http://{user}:{pass}@{app-uuid}.{region}.suggestgrid.space`

If [SuggestGrid Heroku add-on](https://devcenter.heroku.com/articles/suggestgrid) is installed, `SUGGESTGRID_URL` is set automatically.

You can authenticate your application using `SUGGESTGRID_URL` environment variable like the example below:

###### config/initializers/suggest_grid.rb
```ruby
sg_uri = ENV['SUGGESTGRID_URL']

# Initialize the SuggestGrid client.
::SuggestGridClient = SuggestGrid::SuggestGridClient.new sg_uri
```


Every recommendation logic needs to belong to a *type*.
For this demonstration we can create an implicit type named as `views`.
This could be done either from the dashboard or with a snippet like this:

###### lib/tasks/suggestgrid.rake
```ruby
# Should be invoked as `$ rake suggestgrid:initialize`

namespace :suggestgrid do
  desc 'Checks if given type is exists else creates it'
  task initialize: :environment do
    begin
      SuggestGridClient.type.get_type('views')
      puts "SuggestGrid type named 'views' already exists, skipping creation."
    rescue SuggestGrid::APIException => e
      SuggestGridClient.type.create_type('views')
      puts "SuggestGrid type named 'views' is created."
    end
  end
end
```



### 2. Post actions
Once the type exists, let's start posting actions.
We should invoke SuggestGrid client's action.post_action when an user views an item in our application.

We can do this by putting the snippet below on the relevant point:

```ruby
# Send action to SuggestGrid.
class MoviesController < ApplicationController
  def post_suggestgrid_action(user)
    begin
      SuggestGridClient.action.post_action(SuggestGrid::Action.new(user.id, self.id), 'views')
    rescue Exception => e
      logger.error "Exception while sending action #{e}"
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movie.post_suggestgrid_action(current_user)
  end

  private :post_suggestgrid_action
end
```


The more actions SuggestGrid gets, more relevant and diverse its responses are.


### 3. Get recommendations
Finally, let's show "movies similar users viewed" on movie pages.

SuggestGrid needs *recommendation models* for returning recommendations.
Model generation is scheduled in every 24 hours.
In addition, instant model generations can be triggered on the dashboard.

Once the first model generated for 'views' type, recommendations could be get using a snippet like the following:

```ruby
class MoviesController < ApplicationController

  def get_recommendations(user)
    begin
      items_response = SuggestGridClient.recommendation.recommend_items({user_id: user.id}, 'views')
      Movie.find(items_response.items.collect { |item| item[:id] }) # fetch from db
    rescue Exception => e
      logger.error "Exception while getting recommendations #{e}"
      Movie.all.limit(size)
    end
  end

  def index
    @recommended_movies = Movie.recommend(user)
  end

  private :get_recommendations
end
```
