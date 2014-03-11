class BoardsController < ApplicationController
  def index
    @boards = current_user.boards
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end
  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(params[:board])
      redirect_to boards_url, :notice => "Your Board has been updated successfully!"
    else
      render :edit
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params[:board])
    @board.user = current_user

    if @board.save
      redirect_to boards_url, :notice => "Your Board has been created successfully!"
    else
      render :new
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url, :notice => "Your Board has been deleted successfully!"
  end

end
