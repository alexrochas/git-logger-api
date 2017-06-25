require 'sinatra'
require 'json'
require 'mongo'

class GitLogger < Sinatra::Base

  post '/command' do
    client = Mongo::Client.new(ENV['MONGODB_URI']||='mongodb://localhost:27017/git_logger')
    collection = client[:commands]

    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read

    collection.insert_one(data)

    status 200
    body ''
  end

end
