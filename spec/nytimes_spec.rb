require "rspec"
require "pry"
require "./lib/nytimes.rb"

class Nytimes
  describe "data" do
    before :each do
      @hash = Nytimes::DATA
    end

      #FINISHED EXAMPLE: Using @hash, define a variable called `result` that returns the status
    it "can get status" do
      result = @hash[:status]
      expect(result).to eq("OK")
    end

      #Using @hash, define a variable called `result` that returns the copyright
    it "can get copyright" do
      result = @hash[:copyright]
      expect(result).to eq("Copyright (c) 2018 The New York Times Company. All Rights Reserved.")
    end

      #Using @hash, define a variable called `result` that returns the array of stories
    it "can get array of stories" do
      result = @hash[:results]
      expect(result).to be_an_instance_of(Array)
      expect(result.count).to eq(44)
    end

      #Using @hash, define a variable called `result` that returns all stories with subsection of politics.
    it "can get all stories with subsection of politics" do
      require "pry"

      binding.pry

      result = @hash[:results].select do |story|
        story[:subsection] == "Politics"
      end

      expect(result).to be_an_instance_of(Array)
      expect(result.count).to eq(6)
      expect(result.first[:title]).to eq("Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight")
      expect(result.last[:title]).to eq("Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.")
    end
  end
end
