class MinesweeperService
  def self.generate_board(width, height, mines)
    mine_positions = generate_mine_positions(width, height, mines)
    create_board(width, height, mine_positions)
  end

  def self.generate_mine_positions(width, height, mines)
    positions = []
    max_position = width * height - 1

    while positions.length < mines
      position = rand(0..max_position)
      x = position % width
      y = position / width
      positions << [x, y] unless positions.include?([x, y])
    end

    positions
  end

  def self.create_board(width, height, mine_positions)
    board = Array.new(height) { Array.new(width, 0) }

    mine_positions.each do |position|
      x, y = position
      board[y][x] = :x
    end

    board
  end
end
