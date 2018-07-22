class TweetsController < ApplicationController

  get '/tweets/new' do #new tweets page request
    erb :"tweets/new"
  end



end
