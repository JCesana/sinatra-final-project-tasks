class ListsController < ApplicationController

  get '/lists/:slug' do
    binding.pry
    @list = List.find_by_slug(params[:slug])
    binding.pry

    erb :"/lists/show"
  end

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

end
