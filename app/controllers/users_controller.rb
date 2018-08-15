class UsersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    binding.pry

    @user = User.new(params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect "/lists"
    else
      redirect "/signup"
    end
  end

end
