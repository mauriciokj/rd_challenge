require 'spec_helper'

describe RdChallenge::Run do 
	before :each do

		@run = Class.new do
			include RdChallenge::Run

			def id
				"id"
			end					
		end

		@run = @run.new
		allow(@run).to receive(:class).and_return(double('class', name: 'Run'))
	end

	it "should store the authentication params" do
		@run.authenticate do |auth|
			auth.client_id = 'id'
		end
		expect(@run.authenticate.client_id).to eq('id')
	end
	it "should setup the attributes to use in salesforce" do
		RdChallenge::Run.setup do |attribute|
			attribute.Name= 'name'
		end
		expect(RdChallenge::Run.send(:Name)).to eq('name')
	end
	it "should call the Restforce create" do
			expect(@run.client).to receive(:create)
			@run.save

	end
end