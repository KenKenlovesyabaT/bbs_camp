require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/contribution.rb'

before do


end

get '/' do
    erb :index
end

post '/new' do
    if params[:user_name]!= "" and params[:body]!=""
        Contribution.create({
            name: params[:user_name],
            body: params[:body],
            good: 0
        })
    end
    redirect '/wish'
end

post '/good/:id' do
    content = Contribution.find(params[:id])
    good = content.good
    content.update({
        good: good + 1
    })
    redirect '/wish'
end
    
post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/wish'
end

get '/edit/:id' do
    @content = Contribution.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    content = Contribution.find(params[:id])
    content.update({
        name: params[:user_name],
        body: params[:body]
    })
    redirect '/wish'
end

get '/wish' do
    @contents = Contribution.all.order('id desc')
    erb :wish
end