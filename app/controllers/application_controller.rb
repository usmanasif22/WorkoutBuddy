class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    def time_ago_in_words(from_time)
        distance_of_time_in_words(from_time, Time.now)
    end
    
end
