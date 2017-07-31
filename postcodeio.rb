require 'httparty'
require 'json'

class Postcodeio
	attr_accessor :single_postcode_result

	include HTTParty
	
	base_uri 'https://api.postcodes.io'
	def single_postcode_search(postcode)
			x = self.class.get("/postcodes/#{postcode}")
			@single_postcode_result = JSON.parse(x.body)
	end
end