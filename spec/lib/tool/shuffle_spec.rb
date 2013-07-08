require 'spec_helper'

describe Tool::Shuffle do
  let(:shuffler) { Tool::Shuffle.new }
  let(:subject)  { Tool::Shuffle }
  context "shuffling" do
    describe "#number_of_rounds" do
      it "calculates number of tours" do
        subject.number_of_rounds(7).should == 5
        subject.number_of_rounds(8).should == 6
        subject.number_of_rounds(9).should == 7
        subject.number_of_rounds(10).should == 8
        subject.number_of_rounds(11).should == 8
        subject.number_of_rounds(12).should == 9
        subject.number_of_rounds(13).should == 10
        subject.number_of_rounds(14).should == 10
      end
    end
  end
end
