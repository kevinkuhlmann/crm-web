require_relative 'rolodex'
require_relative 'contacts'
require'sinatra'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  erb :homepage
end

get "/contacts" do

  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  $rolodex.add_contact(new_contact)
  redirect to('/')
end


# get '/contacts/new' do
#   puts
#   puts "params => #{params}"
#   puts

#   "GET request: #{params}"

# end

# post '/contacts/new' do
#   puts
#   puts "params => #{params}"
#   puts

#   "POST request: #{params}"

# end
