require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index
end