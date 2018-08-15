class TasksController < ApplicationController

  post '/tasks/new' do
    binding.pry
    @user = current_user(session)
    @task = Task.new(params[:task])
    binding.pry
    if @task.valid?
      binding.pry
      @task.save
      binding.pry
      redirect "lists/#{@task.list.slug}"
    else
      redirect "lists/#{@task.list.slug}"
    end
  end
end
