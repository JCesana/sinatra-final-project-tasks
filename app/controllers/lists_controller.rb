require 'rack-flash'

class ListsController < ApplicationController
  use Rack::Flash

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
      flash[:warning] = "List name cannot be blank."
      redirect "/lists/new"
    end
  end

  get '/lists/:slug/edit' do
    redirect_if_not_logged_in
    @user = current_user(session)

    @list = List.find_by_slug(params[:slug])

    erb :"/lists/edit"
  end

  get '/lists/:slug' do
    @list = List.find_by_slug(params[:slug])
    @user = current_user(session)

    erb :"/lists/show"
  end

  patch "/lists/:slug" do
    redirect_if_not_logged_in
    @user = current_user(session)

    valid_list = List.new(params[:list])

    if valid_list.valid?
      @list = List.find_by_slug(params[:slug])
      @list.update(params[:list])
      @list.save

      redirect "/lists/#{@list.slug}"
    else
      flash[:warning] = "List name cannot be blank."
      redirect "/users/#{@user.slug}"
    end

  end

  delete "/lists/:slug" do
    @list = List.find_by_slug(params[:slug])

    if @list.user == current_user(session)
      @list.destroy if @list
    end

    redirect "/users/#{@list.user.slug}"
  end

end
