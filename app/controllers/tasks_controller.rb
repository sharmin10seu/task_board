class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.board_id = session[:board_id]
    if @task.save
      redirect_to tasks_url, :notice => "Your Task has been created successfully!"
    else
      render :new
    end
  end

  def index
    if params[:board_id].present?
      session[:board_id] = params[:board_id]
    end

    @board = Board.find(session[:board_id])
    @tasks = @board.tasks
    @tasks = @tasks.paginate(:page => params[:page], :per_page => 3)
    #@tasks = Task.where("board_id=?", params[:board_id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to tasks_url ,:notice => "Your Task is Updated Successfully"
    else render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, :notice => "Your Task is Deleted Successfully"
  end
end
