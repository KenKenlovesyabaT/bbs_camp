require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/contributions.rb'

before do


end

get '/' do
    @contents = Contribution.all.order('id desc')
    erb :index
end

post '/new' do
    Contribution.create({
        name: params[:user_name],
        body: params[:body]
    })
    redirect '/'
end