require 'sinatra'
require 'contact'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new
end

get '/contacts/new' do
	erb :new
end