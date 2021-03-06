module TicTacToeConsole
  module Ui
    class InputMove
      ENTER_MOVE_PROMPT = "Player %s, Please enter your next move: "
      CANNOT_MAKE_MOVE_PROMPT = "Cannot make that move, try again."
      INDEX_OFFSET = 1
      attr_reader :value, :board

      def initialize(input, marker, board)
        @input = input
        @marker = marker
        @board = board
      end

      def parse_input
        @value = convert_input_to_move(@input.gets)
      end

      def valid?
        @value && board.is_available?(@value)
      end

      def prompt_message
        ENTER_MOVE_PROMPT % @marker
      end

      def invalid_message
        CANNOT_MAKE_MOVE_PROMPT
      end

      private

      def convert_input_to_move(value)
        value = value[/^([1-9]|1[0-6])$/] && value.to_i
        value - INDEX_OFFSET if value
      end
    end
  end
end
