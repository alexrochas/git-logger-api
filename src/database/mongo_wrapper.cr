require "mongo"

module Database::MongoWrapper

    def self.add(command)
        client = Mongo::Client.new "mongodb://localhost:27017/git_logger"
        db = client["git_logger_api"]

        collection = db["commands"]
        collection.insert({ "command" => command })
    end

end
