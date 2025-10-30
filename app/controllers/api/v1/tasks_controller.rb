class Api::V1::TasksController < ApplicationController
before_action :authenticate_user!, only: :create
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save!
      render json: @task
    else
      render json: @task.errors.full_messages
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def task_params
    params.require(:task).permit(:title, :task_date, :completed)
  end
end
