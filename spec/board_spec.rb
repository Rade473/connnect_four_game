require_relative '../lib/board'
describe Board do
  subject(:board) { described_class.new }
  describe "#check" do
    before do
      board.grid = [[0, 0, 0, 0, 0, 1, 1],
                  [0, 0, 1, 0, 1, 0, 1],
                  [0, 0, 0, 1, 0, 0, 1],
                  [0, 0, 1, 0, 1, 0, 1],
                  [0, 0, 0, 0, 0, 1, 0],
                  [0, 1, 1, 1, 1, 0, 0]]
    end
    it 'returns true when 4 are equal in diagonal from left' do
      expect(board.check_diagonal_left(1)).to be true
    end
    it 'returns true when 4 are equal in diagonal from right' do
      expect(board.check_diagonal_right(1)).to be true
    end
    it 'returns true when 4 are equal in horizontal' do
      expect(board.check_horizontal(1)).to be true
    end
    it 'returns true when 4 are equal in vertical' do
      expect(board.check_vertical(1)).to be true
    end
  end
  describe '#free_row' do
  before do
    board.grid = [
    ["○", "○", "○", "○", "○", "○", "○"],
    ["○", "○", "○", "○", "○", "○", "○"],
    ["○", "○", "○", "○", "○", "○", "○"],
    ["○", "○", "○", 2, "○", "○", "○"],
    ["○", "○", "○", 2, "○", "○", "○"],
    ["○", 1, "○", 2, "○", "○", "○"]]
  end
  it 'returns correct row index with empty spot in the column' do
    expect(board.free_row(1)).to eq(4)
    expect(board.free_row(3)).to eq(2)
  end
  end

  describe '#update_row' do
    before do
      board.grid = Array.new(6) { Array.new(7) { 0 } }
    end
    it 'updates the board with a given symbol at a correct spot' do
      board.update_board(0, 0, 1)
      board.update_board(1, 1, 1)
      board.update_board(3, 4, 1)
      result = [[1, 0, 0, 0, 0, 0, 0],
                [0, 1, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0]]
      expect(board.grid).to eq(result)
    end
  end
end




# it should create a board

# it should update a board with colors

# it should check for game over


# it should send game over message to game_spec