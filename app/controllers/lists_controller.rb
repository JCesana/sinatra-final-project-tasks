class ListsController < ApplicationController

  get '/lists' do
    redirect_if_not_logged_in
    @user = current_user

    erb :lists
  end

end
