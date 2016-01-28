class TaskController < ApplicationController
  # def new
  #   @task = Task.new
  # end

  # def save
  #   t = Task.new
  #   t.save
  #   render text: "Task saved"
  # end

  # def create
  #   t = Task.new(task_params)
  #   t.user = current_user
  #   t.save
  #   redirect_to root_url
  # end

  private
  def task_params
    params.permit(:task)
  end
end
