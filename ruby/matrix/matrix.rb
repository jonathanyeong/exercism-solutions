=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  attr_accessor :unparsed_matrix

  def initialize(unparsed_matrix)
    @unparsed_matrix = unparsed_matrix
  end

  # 1 2\n3 4
  # 1 2
  # 3 4
  # 3  4
  def rows
    # This would break if there's a second space between the numbers
    @unparsed_matrix.split("\n").map{|r| r.strip.split(" ").map(&:to_i)}
  end


  def columns
    cols = []
    index = 0
    rows.each do |r|
      r.each_with_index do |val, index|
        if cols[index]
          cols[index] << val
        else
          cols[index] = [val]
        end
      end
    end
    cols
  end
end
