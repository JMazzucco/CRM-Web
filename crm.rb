require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex= Rolodex.new

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get '/contacts/new_contact' do
	erb :new_contact
end

get '/about' do
	erb :about
end

get '/resources' do
	erb :resources
end

get '/news' do
	erb :news
end

get '/contacts/:id' do
	@contact = $rolodex.find(params[:id].to_i)
  erb :show
end

# get '/:menu_page' do
# 	menu = params[:menu_page]
# 	erb menu
# end

# get '/articles/:article_name'
# 	if File.exist?("views/#{params[:article_name]}.erb")
# 		erb params[:article_name]
# 	else
# 		erb :error_page
# 	end
# end