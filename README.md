# RD Challenge

Use this gem to integrate your Rails app with Salesforce

## Installation

Add this line to your application's Gemfile:

    gem 'rd_challenge', git: 'https://github.com/mauriciokj/rd_challenge.git'

And then execute:

    $ bundle

## Usage
In your model include the RdChallenge::Run 

Then configure the salesforce authentication params in your controller

  @object.setup do |auth|
    auth.client_id = current_user.salesforce_configuration.client_id
    auth.client_secret = current_user.salesforce_configuration.client_secret
    auth.username = current_user.salesforce_configuration.username
    auth.password = current_user.salesforce_configuration.password
    auth.security_token = current_user.salesforce_configuration.security_token
  end

Then configure the salesforce attribute after save on controller
  RdChallenge::Run.setup do |attribute|
    attribute.FirstName = @object.first_name
    attribute.LastName = @object.last_name
    attribute.Email = @object.email
    attribute.Phone = @object.phone
    attribute.Company = @object.company
    attribute.Id = @object.sales_force_id
  end

The following methods are available:

	@contact.save_on_salesforce #it returns the id from salesforce
	@contact.destroy_on_sales_force(salesforce_id)

## Special thanks
To my friend Geison that showed me the way  and indicated me to the RD

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rd_challenge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request    
