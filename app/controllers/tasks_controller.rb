class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to action: :index
    else
      render :edit
    end

  end

  def completed
    @task = Task.find(params[:id])
    @task.update completed: Date.today
    redirect_to action: :index
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to action: :index
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

end
