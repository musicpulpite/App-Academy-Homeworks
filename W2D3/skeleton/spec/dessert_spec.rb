require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:brownies) {Dessert.new("brownie", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownies.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownies.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(brownies.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownies", "non-integer", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      brownies.add_ingredient("fudge")
    end

    it "adds an ingredient to the ingredients array" do
      expect(brownies.ingredients).to eq(["fudge"])
    end
  end

  describe "#mix!" do
    before(:each) do
      brownies.mix!
    end

    it "shuffles the ingredient array"#?????
  end

  describe "#eat" do
    brownies.eat(5)
    it "subtracts an amount from the quantity" do
      expect(brownies.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownies.eat(100)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect {brownies.serve}.to contain(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
