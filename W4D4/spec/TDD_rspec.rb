# require 'rspec'
require 'TDD'
# require_relative 'TDD'

describe "TDD:" do
  let(:array) {[1, 2, 1, 3, 3]}
  let(:uniqs) {[1, 2, 3]}

  describe "my_uniq" do
    it "should accept an array of numbers as an arg" do
      expect { my_uniq(array) }.to_not raise_error
    end

    it "should remove duplicates" do
      expect(my_uniq(array)).to eq(uniqs)
      # array.each do |element|
        # expect(uniqs.count(element)).to eq(1)
      # end
    end
  end
end

describe "Array" do
  subject(:array) {[-1, 0, 2, -2, 1]}
  describe "#two_sum" do
    it "should return a new array with index-pair subarrays" do
      # expect(Array.two_sum).to eq([[0, 4], [2, 3]])
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do 
  let(:matrix) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}
  it "will transpose a matrix" do
    expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "#stock_picker" do
  let(:stocks) {[3, 5, 7, 4, 12, 11, 14, 9]}
  it "will find the best pair of days to buy & sell stocks" do
    expect(stock_picker(stocks)).to eq([0, 6])
  end
end