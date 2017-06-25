require 'sinatra'
require 'json'
require 'mongo'

class GitLogger < Sinatra::Base

  post '/command' do
    client = Mongo::Client.new([ 'localhost:27017' ], :database => 'git_logger')
    collection = client[:commands]

    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read

    result = collection.insert_one(data)
    result.n
  end

end
