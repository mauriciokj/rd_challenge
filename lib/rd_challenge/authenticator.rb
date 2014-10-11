class RdChallenge::Authenticator
	attr_accessor :client_id, :client_secret, :username, :password, :security_token

	def authenticate
		return @client if @client
		@client = Restforce.new(
								:username => username, 
								:password => password , 
								:security_token => security_token, 
								:client_id => client_id, 
								:client_secret  => client_secret
								)
		@client
	end

end