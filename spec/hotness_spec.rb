require_relative "../hotness.rb"

describe Hotness do 
	before do
		class Image
			include Hotness
		end
		@image = Image.new
	end

	it "should return a start date" do
		aug_13 = Time.local(2014, 8, 13)
		expect(Hotness::START_DATE).to eq(aug_13)
	end

	it "#seconds_from_start_time should return seconds from a given time" do
		seconds_in_a_day = 86400 
		aug_13 = Time.local(2014, 8, 13)
		expect(@image.seconds_from_start_time(aug_13)).to eq(seconds_in_a_day)
	end

	context "#hot" do
		it "should return 0 hot when next day, 0 ups, 0 downs" do
			thursday = Time.local(2014 8, 14)
			expect(@image.hot(0, 0, thursday).to eq(1))
		end

		it "" do
		end




	end


	
end