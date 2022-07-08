require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/contribution.rb'

before do


end

get '/wish' do
    erb :index
end

post '/new' do
  rnum = rand(5)
  case rnum
  when 0 then
    color = "#b6ddf2"    
  when 1 then
    color = "#f4b6cd"
  when 2 then
    color = "#eaeab8"
  when 3 then
    color = "#aed8b3"
  else
    color = "#ad9cc9"
  end
  
    if params[:user_name]!= "" and params[:body]!=""
        Contribution.create({
            name: params[:user_name],
            body: params[:body],
            color: color, 
            good: 0
        })
    end
    
    redirect '/'
end

post '/good/:id' do
    content = Contribution.find(params[:id])
    good = content.good
    content.update({
        good: good + 1
    })
    redirect '/'
end
    
post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/'
end

get '/edit/:id' do
    @content = Contribution.find(params[:id])
    erb :edit
end

post '/edit/:id' do
    @content = Contribution.find(params[:id])
    redirect '/edit'
end

post '/renew/:id' do
    content = Contribution.find(params[:id])
    content.update({
        name: params[:user_name],
        body: params[:body]
    })
    redirect '/'
end

get '/' do
    @contents = Contribution.all.order('id desc')
    erb :wish
end