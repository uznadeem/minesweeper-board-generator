class BoardsController < ApplicationController
  before_action :check_mines_within_board_size, only: :create

  def index
    @boards = Board.order(created_at: :desc).all
  end

  def new
    @board = Board.new
    @recent_boards = Board.order(created_at: :desc).limit(10)
  end

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
    params.require(:board).permit(:name, :email, :width, :height, :mines).transform_keys(&:to_sym)
  end

  def check_mines_within_board_size
    if board_params[:mines].to_i > board_params[:height].to_i * board_params[:width].to_i
      flash[:alert] = "Number of mines can't be greater than the total number of cells."
      render :new, status: :unprocessable_entity
    end
  end
end
