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

get '/contacts/edit' do
  erb :edit_contact
end

get "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end


get "/contacts/:id/edit" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    $rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')

# post '/contacts' do
#   edit_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
#   $rolodex.add_contact(new_contact)
#   redirect to('/contacts')
end

# put '/contacts' do
#     erb
