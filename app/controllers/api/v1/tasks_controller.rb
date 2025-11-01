class Api::V1::TasksController < ApplicationController
before_action :authenticate_user!, only: [:create, :show, :update, :destroy]
before_action :set_task, only: [:show, :update, :destroy]
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

  def destroy
    @task.destroy!
    render json: {message: "Task was successfully destroyed."}
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors.full_messages
    end
  end

  def show
    render json: @task
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :task_date, :completed)
  end
end
