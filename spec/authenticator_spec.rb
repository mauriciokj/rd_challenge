require 'spec_helper'

describe RdChallenge::Authenticator do 
	
	let(:client_id) { 'client_id' }
	let(:client_secret) { 'client_secret' }
	let(:username) { "username@example.com" }
	let(:password) { "password" }
	let(:security_token) { "security_token?" }

	before :each do		
		@authenticator = RdChallenge::Authenticator.new
		@authenticator.client_id = client_id
		@authenticator.client_secret = client_secret
		@authenticator.username = username
		@authenticator.password = password
		@authenticator.security_token = security_token		
		@authenticator.authenticate
	end

	it "should return an RdChallenge::Authenticator object" do
		expect(@authenticator.client_id).to eq(client_id)
		expect(@authenticator.client_secret).to eq(client_secret)
	end

	it "should return an Restforce client" do
		expect(@authenticator.client).to be_an(Restforce::Data::Client)
	end


end