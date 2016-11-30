class TasksController < ApplicationController
  before_action :set_list

  def create
    @task = @list.tasks.create(task_params)
    redirect_to @list
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task deleted"
    else
      flash[:error] = "Task couldn't be deleted"
    end
    redirect_to @list
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params[:task].permit(:content)
  end
end
