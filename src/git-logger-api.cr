require "./git-logger-api/*"
require "kemal"
require "./database/mongo_wrapper"

module Git::Logger::Api

    post "/" do |env|
        begin
            Database::MongoWrapper.add(env.params.json["command"])
        rescue error
            env.response.status_code = 400
            {"error" => error.message}.to_json
        end
    end

    Kemal.run(ENV["PORT"])

end
