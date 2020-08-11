# frozen_string_literal: true

# this file is where we perform all our CRUD actions via methods
class TasksController < ApplicationController
  # see methodname.html.erb for the corresponding view
  def index
    @tasks = Task.all # list all task instances
  end

  def show
    @task = Task.find(params[:id]) # select the task by its ID
  end

  def new
    @task = Task.new # create a new instance of task
  end

  def create
    @task = Task.new(task_params) # we cannot save data without strong params - see private method below
    @task.save # when creating, we always need to save
    redirect_to task_path(@task) # to show we have updated, redirects back
  end

  def edit
    @task = Task.find(params[:id]) # select the task by its ID
  end

  def update
    @task = Task.find(params[:id]) # select task by its iD
    @task.update(task_params) # update the task by selecting that specific task (with strong params too)
    redirect_to task_path(@task) # to show we have updated, redirects back
  end

  def destroy
    @task = Task.find(params[:id]) # select the task by its ID
    @task.destroy
    redirect_to tasks_path # to show we have updated, redirects back
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
