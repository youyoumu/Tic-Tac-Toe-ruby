require './lib/board.rb'

describe Board do
  describe "#game_over?" do
    subject(:board_game_over) { described_class.new("Player 1", "Player 2", "X", "O")}
    it "return false if no one wins" do
      expect(board_game_over.game_over?).to eq false
    end

    it "return true if someone wins" do
      board_game_over.board_array[0] = "X"
      board_game_over.board_array[1] = "X"
      board_game_over.board_array[2] = "X"
      expect(board_game_over.game_over?).to eq true
    end
  end

  describe "#coordinate_empty?" do
    subject(:board_coordinate) { described_class.new("Player 1", "Player 2", "X", "O")}
    it "return false if the coordinate is not empty" do
      board_coordinate.board_array[0] = "X"
      expect(board_coordinate.coordinate_empty?(1)).to eq false
    end

    it "return true if the coordinate is empty" do
      expect(board_coordinate.coordinate_empty?(1)).to eq true
    end
  end

  describe "#input_valid?" do
    subject(:board_input) { described_class.new("Player 1", "Player 2", "X", "O")}
    it "return false if the input is not string number 1 - 9" do
      expect(board_input.input_valid?("10")).to eq false
    end

    it "return true if the input is string number 1 - 9" do
      expect(board_input.input_valid?("8")).to eq true
    end

    it "return false if the input is string number 1 - 9 but the coordinate is not empty" do
      board_input.board_array[0] = "X"
      expect(board_input.input_valid?("8")).to eq true
    end
  end

  describe "#take_turn_player1" do
    subject(:board_take_turn) { described_class.new("Player 1", "Player 2", "X", "O") }
    context "when player1 input the invalid input once" do
      before do
        allow(board_take_turn).to receive(:gets).and_return("10", "1")
      end
      it "receive #gets twice" do
        message = 'Input invalid! Try again: '
        expect(board_take_turn).to receive(:gets).twice
        board_take_turn.take_turn_player1
      end

      it "receive #draw once" do
        expect(board_take_turn).to receive(:draw).once
        board_take_turn.take_turn_player1
      end
    end
  end
end
