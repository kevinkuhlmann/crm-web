require_relative 'rolodex'
require_relative 'contacts'
require'sinatra'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do

  erb :contacts
end

get '/new' do
  erb :new
end
