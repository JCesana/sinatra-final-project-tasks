require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
          redirect “/failure”
      end
    end

    def logged_in?(session)
      !!session[:user_id]
    end

    def current_user(session)
      User.find_by_id(session[:user_id])
    end

    def self.slug(user)
    end
  end
end
