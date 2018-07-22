class TweetsController < ApplicationController

  get '/tweets/new' do #new tweets page request
    erb :"tweets/new"
  end

  post '/tweets' do #create tweet and redirect
    @tweet = Tweet.create(params[:tweet])
  end

end
