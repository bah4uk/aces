require 'spec_helper'

describe Tool::Shuffle do
  let(:shuffler) { Tool::Shuffle.new }
  let(:subject)  { Tool::Shuffle }
  context "shuffling" do
    describe "#number_of_tours" do
      it "calculates number of tours" do
        subject.number_of_tours(7).should == 5
        subject.number_of_tours(8).should == 10
        subject.number_of_tours(14).should == 10
        subject.number_of_tours(15).should == 15
        subject.number_of_tours(21).should == 15
      end
    end
  end
end
