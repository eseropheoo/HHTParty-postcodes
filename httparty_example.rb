# require 'httparty'
require 'json'
include HTTParty

class Postcodeio
	
	attr_accessor :single_postcode_result



		base_uri 'https://api.postcodes.io'

		def single_postcode_search(postcode)
			x = self.class.get("/postcodes/#{postcode}")
			@single_postcode_result = JSON.parse(x.body)
		end

end

x = Postcodeio.new

 x.single_postcode_search('se96rj')

puts x.single_postcode_result

