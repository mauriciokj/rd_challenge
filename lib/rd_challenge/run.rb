module RdChallenge::Run
	attr_accessor :client
	ATTRIBUTES = [:Id, :IsDeleted,:MasterRecordId, :LastName, :FirstName,
									:Salutation, :Name, :Title, :Company,:Street, :City,
									:State, :PostalCode, :Country, :Phone, :MobilePhone,
									:Fax, :Email, :Website, :Description, :LeadSource,
									:Status, :Industry, :Rating, :AnnualRevenue, :NumberOfEmployees,
									:OwnerId, :IsConverted, :ConvertedDate, :ConvertedAccountId,
									:ConvertedContactId, :ConvertedOpportunityId, :IsUnreadByOwner,
									:CreatedDate, :CreatedById, :LastModifiedDate, :LastModifiedById,
									:SystemModstamp, :LastActivityDate, :Jigsaw, :JigsawContactId,
									:CleanStatus, :CompanyDunsNumber, :DandbCompanyId, :EmailBouncedReason,
									:EmailBouncedDate, :SICCode__c, :ProductInterest__c, :Primary__c,
									:CurrentGenerators__c, :NumberofLocations__c]
	class << self
		ATTRIBUTES.each {|atribute| attr_accessor atribute} 

	end
	@@Id= nil; @@IsDeleted= nil;@@MasterRecordId= nil; @@LastName= nil; @@FirstName= nil;
	@@Salutation= nil; @@Name= nil; @@Title= nil; @@Company= nil;@@Street= nil; @@City= nil;
	@@State= nil; @@PostalCode= nil; @@Country= nil; @@Phone= nil; @@MobilePhone= nil;
	@@Fax= nil; @@Email= nil; @@Website= nil; @@Description= nil; @@LeadSource= nil;
	@@Status= nil; @@Industry= nil; @@Rating= nil; @@AnnualRevenue= nil; @@NumberOfEmployees= nil;
	@@OwnerId= nil; @@IsConverted= nil; @@ConvertedDate= nil; @@ConvertedAccountId= nil;
	@@ConvertedContactId= nil; @@ConvertedOpportunityId= nil; @@IsUnreadByOwner= nil;
	@@CreatedDate= nil; @@CreatedById= nil; @@LastModifiedDate= nil; @@LastModifiedById= nil;
	@@SystemModstamp= nil; @@LastActivityDate= nil; @@Jigsaw= nil; @@JigsawContactId= nil;
	@@CleanStatus= nil; @@CompanyDunsNumber= nil; @@DandbCompanyId= nil; @@EmailBouncedReason= nil;
	@@EmailBouncedDate= nil; @@SICCode__c= nil; @@ProductInterest__c= nil; @@Primary__c= nil;
	@@CurrentGenerators__c= nil; @@NumberofLocations__c


	def self.setup
		yield self
	end

	def authenticate
		@authenticate ||= RdChallenge::Authenticator.new
		yield(@authenticate) if block_given?
		@authenticate.authenticate
		self.client = @authenticate.client
		@authenticate
	end		

	def destroy_on_sales_force(id)
		puts "start to destroy on salesforce with id #{id}"
		client.destroy('Lead',id )
	end

	def save_on_sales_force
		puts "start to save on salesforce"
		puts "setting all attributes"
		sales_force_attributes = {}
		ATTRIBUTES.each do |attribute|
			puts "#{attribute} will receive #{RdChallenge::Run.send(attribute)}" if RdChallenge::Run.send(attribute)
			sales_force_attributes[attribute] = RdChallenge::Run.send(attribute) if RdChallenge::Run.send(attribute)
		end
		salesforce_id = RdChallenge::Run.Id
		if salesforce_id
			self.client.update('Lead', sales_force_attributes)
		else	
			self.client.create('Lead', sales_force_attributes)
		end
	end

end
