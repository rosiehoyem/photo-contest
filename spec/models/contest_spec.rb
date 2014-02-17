require 'spec_helper'

describe Contest do

	describe "default attributes" do

	  it "is invalid without an api key" do
			contest = FactoryGirl.build(:contest, api_key: nil)
			expect(contest).to have(2).errors_on(:api_key)
		end
 
    it "includes httparty methods" do
      expect(Contest).to include(HTTParty)
    end
 
  end

  # describe "GET contest status" do

  # 	let(:contest) { FactoryGirl.build(:contest) }
 
	 #  before(:each) do
	 #    VCR.insert_cassette 'contest', :record => :new_episodes
	 #  end
	 
	 #  after(:each) do
	 #    VCR.eject_cassette
	 #  end
	 
	 #  it "records the fixture" do
	 #  	HTTParty.get('http://pv.pop.umn.edu/contest/strike-near-none-clock-paris-58')
	 #  end

	 #  it "gets the status of the contest" do
	 #    expect(Contest).to respond_to(:contest_status)
	 #  end
	 
	 #  it "parses the api response from JSON to Hash" do
	 #    expect(contest.contest_status).to be_instance_of(Hash)
	 #  end
	 
	 #  it "performs the request and gets the data" do
	 #    expect(contest.contest_status["contest"]["name"]).to eq('Rosanne.Hoyem')
	 #  end
  # end
end
