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
end

# it should create a board

# it should update a board with colors

# it should check for game over


# it should send game over message to game_spec