class ListsController < ApplicationController

  get '/lists' do
    redirect_if_not_logged_in
    @user = current_user(session)

    erb :lists
  end

  get '/lists/new' do
    redirect_if_not_logged_in
    @user = current_user(session)

    erb :"/lists/new"
  end

  post '/lists' do
    @user = current_user(session)
    list = List.new(params)

    if list.valid?
      list.save
      redirect "users/#{@user.slug}"
    else
      redirect "/lists/new"
    end
  end

end
