require 'spec_helper'


describe "testing a single postcode search" do 
	before(:each) do
		@postcodesio = Postcodeio.new
	end
	it "should result in a status of 200" do
		expect(@postcodesio.single_postcode_search('se91rf')["status"]).to eq(200)
		expect(@postcodesio.single_postcode_search('se193jd')["status"]).to eq(200)

	end
	it "should return the same postcodes that was searched" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"] ["postcode"]).to eq("SE9 1RF")
		expect(@postcodesio.single_postcode_search('se193jd')["result"] ["postcode"]).to eq("SE19 3JD")
	end
	it "should return the quality of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["quality"]).to eq(1)
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["quality"]).to eq(1)
	end
	it "should return the eastings of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["eastings"]).to be_within(10).of 543547
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["eastings"]).to be_within(10).of 532056
	end
	it "should return the northings of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["northings"]).to be_within(10).of 175580
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["northings"]).to be_within(10).of 170354
	end
	it "should return the country of the postcodes" do 
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["country"]).to eq("England")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["country"]).to eq("England")
		
		
	end
	it "should return the nhs_ha of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["nhs_ha"]).to eq("London")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["nhs_ha"]).to eq("London")
		expect(@postcodesio.single_postcode_search('rh161hl')["result"]["nhs_ha"]).to eq("South East Coast")
	end
	it "should return the longitude of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["longitude"]).to be_within(0.05). of 0.064906
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["longitude"]).to be_within(0.05). of -0.102348
	end

	it "should return the latitude of the postcodes" do 
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["latitude"]).to be_within(0.5).of 51.460999
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["latitude"]).to be_within(0.5).of 51.416830

	end
	it "should return the parliamentary_constituency of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["parliamentary_constituency"]).to eq("Eltham")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["parliamentary_constituency"]).to eq("Croydon North")
	end
	it "should return european_electoral_region of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["european_electoral_region"]).to eq("London")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["european_electoral_region"]).to eq("London")
	end
	it "should return primary_care_trust of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["primary_care_trust"]).to eq("Greenwich Teaching")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["primary_care_trust"]).to eq("Croydon")
	end
	it "should return region of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["region"]).to eq ("London")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["region"]).to eq ("London")

	end
	it "should return layer super output area (lsoa) of the postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["lsoa"]).to eq ("Greenwich 023A")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["lsoa"]).to eq ("Croydon 002B")
	end
	it "should return middle super output area (msoa) of postcodes" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["msoa"]).to eq("Greenwich 023")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["msoa"]).to eq("Croydon 002")
	end
	it "should return the incode of the postcode" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["incode"]).to eq("1RF")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["incode"]).to eq("3JD")
	end
	it "should return the outcode of the postcode" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["outcode"]).to eq("SE9")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["outcode"]).to eq("SE19")
	end
	it "should return the admin_district of the postcode" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["admin_district"]).to eq("Greenwich")
		expect(@postcodesio.single_postcode_search('se193jd')["result"]["admin_district"]).to eq("Croydon")
	end
	it "should return the parish of the postcode" do
		expect(@postcodesio.single_postcode_search('se91rf')["result"]["parish"]).to eq("Greenwich 023")
	end






	
end