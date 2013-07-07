require 'spec_helper'

describe Tool::Shuffle do
  let(:shuffler) { Tool::Shuffle.new }
  context "shuffling" do
    describe "#number_of_tours" do
      it "calculates number of tours" do
        shuffler.number_of_tours(7).should == 5
      end
    end
  end
end
