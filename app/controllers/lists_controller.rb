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
    @list = List.new(params)

    if @list.valid?
      @list.save
      redirect "lists/#{@list.slug}"
    else
      redirect "/lists/new"
    end
  end

  get '/lists/:slug' do
    @list = List.find_by_slug(params[:slug])

    erb :"/lists/show"
  end

end
