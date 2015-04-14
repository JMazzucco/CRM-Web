require 'sinatra'
require 'data_mapper'
require_relative 'rolodex'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	erb :index
end

get '/contacts' do
	@contacts = Contact.all
  erb :contacts
end

get '/contacts/new_contact' do
  erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
  :first_name => params[:first_name],
  :last_name => params[:last_name],
  :email => params[:email],
  :notes => params[:notes]
  )
  redirect to('/contacts')
end

get "/contacts/:id" do
  @contact = Contact.get(params[:id])
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
	@contact = Contact.get(params[:id])
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id])
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]

    @contact.save
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.get(params[:id])
  if @contact
    @contact.destroy
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

get '/temp' do
  erb :temp
end


# r
# get '/:menu_page' do
#   menu = params[:menu_page]
#   erb menu
# end

# get '/articles/:article_name'
#   if File.exist?("views/#{params[:article_name]}.erb")
#     erb params[:article_name]
#   else
#     erb :error_page
#   end
# end