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
end
