require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug].downcase)
    redirect_if_not_logged_in

    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?(session)
      erb :signup
    else
      redirect "/lists"
    end
  end

  post '/signup' do
    @user = User.new(params)

    if @user.save
      session[:user_id] = @user.id
      redirect "/lists"
    else
      session[:"__FLASH__"][:warning] = "All fields must be filled out."
      redirect "/signup"
    end
  end

  get '/login' do
    if !logged_in?(session)
      erb :login
    else
      redirect "/lists"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/lists'
    else
      session[:"__FLASH__"][:warning] = "Please try again. Incorrect login or empty field."
      redirect '/login'
    end
  end

  get "/logout" do
    if logged_in?(session)
      session.clear
      redirect "/login"
    else
      redirect '/signup'
    end
  end

end
