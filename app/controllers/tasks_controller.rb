class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all.page(params[:page])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:succcess] = 'Taskが正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update

    if @task.update(task_params)
      flash[:succcess] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:succcess] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
