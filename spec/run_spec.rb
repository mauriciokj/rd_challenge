require 'spec_helper'

describe RdChallenge::Run do 
	let(:client_id) { 'client_id' }
	let(:client_secret) { 'client_secret' }
	let(:username) { "username@example.com" }
	let(:password) { "password" }
	let(:security_token) { "security_token?" }
	before :each do

		@run = Class.new do
			include RdChallenge::Run

			def id
				"id"
			end					
		end

		@run = @run.new
		@run.authenticate do |auth|
			auth.client_id = client_id
			auth.client_secret = client_secret
			auth.username = username
			auth.password = password
			auth.security_token = security_token
		end
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
		
		RdChallenge::Run.setup do |attribute|
			attribute.Name= 'name'
		end
		expect(@run.client).to receive(:create)
		@run.save_on_sales_force
	end

	it "should call the Restforce update when had Id" do
		
		RdChallenge::Run.setup do |attribute|
			attribute.Id= 'id'
		end
		expect(@run.client).to receive(:update)
		@run.save_on_sales_force
	end

	it "should call the Restforce destroy" do
		expect(@run.client).to receive(:destroy)
		@run.destroy_on_sales_force(1)
	end
end