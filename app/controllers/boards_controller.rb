class BoardsController < ApplicationController
  def create
    @board = Board.new(email: board_params[:email], name: board_params[:name])
    @board.visual = MinesweeperService.generate_board(
      board_params[:width].to_i,
      board_params[:height].to_i,
      board_params[:mines].to_i
    )

    if @board.save
      redirect_to @board
    else
      render :new
    end
  end

  def show
    @board = Board.find_by(id: params[:id])
  end

  private

  def board_params
    params.permit(:name, :email, :width, :height, :mines).transform_keys(&:to_sym)
  end
end
