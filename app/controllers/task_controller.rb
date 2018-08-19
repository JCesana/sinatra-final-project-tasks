class TasksController < ApplicationController
  post '/tasks/new' do
    @user = current_user(session)
    @task = Task.new(params[:task])

    if @task.valid?
      @task.save
      redirect "lists/#{@task.list.slug}"
    else
      flash[:warning] = "Task name cannot be blank."
      redirect "lists/#{@task.list.slug}"
    end
  end

  get '/tasks/:id/edit' do
    @user = current_user(session)
    redirect_if_not_logged_in

    @task = Task.find_by_id(params[:id])

    erb :'/tasks/edit'
  end

  patch "/tasks/:id" do
    @user = current_user(session)
    redirect_if_not_logged_in

    valid_task = Task.new(params[:task])

    if valid_task.valid?
      @task = Task.find_by_id(params[:id])
      @task.update(params[:task])
      @task.save

      redirect "/lists/#{@task.list.slug}"
    else
      flash[:warning] = "Task name cannot be blank."
      redirect "/users/#{@user.slug}"
    end

  end

  delete "/tasks/:id" do
    @user = current_user(session)
    redirect_if_not_logged_in

    @task = Task.find_by_id(params[:id])

    if @task.list.user == current_user(session)
      @task.destroy if @task
    end

    redirect "lists/#{@task.list.slug}"
  end

end
