require "./git-logger-api/*"
require "kemal"

module Git::Logger::Api

    get "/" do
        "Hello World."
    end

    Kemal.run

end
