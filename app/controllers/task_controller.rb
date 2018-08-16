class TasksController < ApplicationController

  post '/tasks/new' do
    @user = current_user(session)
    @task = Task.new(params[:task])

    if @task.valid?
      @task.save
      redirect "lists/#{@task.list.slug}"
    else
      redirect "lists/#{@task.list.slug}"
    end
  end

  get '/tasks/:slug/edit' do
    redirect_if_not_logged_in
    @task = Task.find_by_slug(params[:slug])

    erb :'/tasks/edit'
  end

  patch "/tasks/:slug" do
    redirect_if_not_logged_in
    @user = current_user(session)

    valid_task = Task.new(params[:task])

    if valid_task.valid?
      @task = Task.find_by_slug(params[:slug])
      @task.update(params[:task])
      @task.save

      redirect "/lists/#{@task.list.slug}"
    else
      redirect "/users/#{@user.slug}"
    end

  end

  delete "/tasks/:slug" do
    redirect_if_not_logged_in
    @task = Task.find_by_slug(params[:slug])

    if @task.list.user == current_user(session)
      @task.destroy if @task
    end

    redirect "lists/#{@task.list.slug}"
  end

end
