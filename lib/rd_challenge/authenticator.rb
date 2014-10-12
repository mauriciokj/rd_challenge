class RdChallenge::Authenticator
	attr_accessor :client, :client_id, :client_secret, :username, :password, :security_token

	def authenticate
		return self.client if self.client
		self.client = Restforce.new(
								:username => username, 
								:password => password , 
								:security_token => security_token, 
								:client_id => client_id, 
								:client_secret  => client_secret
								)
		self
	end

end