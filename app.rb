require 'rubygems'
require 'sinatra/base'
require './models/log'


ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "fanwar",
  :password => "password",
  :database => "logcatcher"
)

#ActiveRecord::Migration.create_table :logs do |t|
#  t.string :content
#end
class LogCatcher < Sinatra::Application

  before do
    request.path_info.gsub!(/\/$/, "") #remove trailing slashes.
  end


  get '/logs' do
    Log.all.to_json
  end

  # Create a new log
  post '/logs' do
    content_type :json
    body = JSON.parse(request.body.read)
    puts "Request: #{body}"
    if (body["logs"].nil?)
      puts "Error because params are invalid: #{params}"
      return send_error(400, 'No log message supplied')
    end

    puts "Now about to add log: #{body["logs"][0]["log"]}"

    l = Log.create({:content=>body["logs"][0]["log"]})
    l.to_json
  end

  get '/logs/:id' do
    l = Log.find_by_id(params[:id])
    if (l.nil?)
      return send_error(404, "Log with id #{params[:id]} doesn't exist!")
    else
       l.to_json
    end
  end

  def send_error(code, message)
    status code
    body ({:status=>code, :message=>message}).to_json
  end
end




