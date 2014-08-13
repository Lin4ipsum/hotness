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
			thursday = Time.local(2014, 8, 14)
		expect(@image.seconds_from_start_date(thursday)).to eq(seconds_in_a_day)
	end

	context "#hot" do
		it "should return 1 hot score when 1 day later, 0 ups, 0 downs" do
			thursday = Time.local(2014, 8, 14)
			expect(@image.hot(0, 0, thursday)).to be == 1
		end

		it "should return 2 hot score when 2 days, 0 ups, 0 downs" do
			friday = Time.local(2014, 8, 15)
			expect(@image.hot(0, 0, friday)).to be == 2
		end

		it "should return 7 hot score when 1 week later, 0 ups, 0 downs" do
			one_week_later = Time.local(2014, 8, 20)
			expect(@image.hot(0, 0, one_week_later)).to be == 7
		end

		it "should return > 30 hot score when 1 month later, 0 ups, 0 downs" do
			one_month_later = Time.local(2014, 9, 13)
			expect(@image.hot(0, 0, one_month_later)).to be > 30
		end

		it "should return hot score > 1, 1 day later, 5 ups, 0 downs" do
			thursday = Time.local(2014, 8, 14)
			expect(@image.hot(5, 0, thursday)).to be > 1
		end

		it "should return hot score > 2, 1 day later, 20 ups, 0 downs" do
			thursday = Time.local(2014, 8, 14)
			expect(@image.hot(20, 0, thursday)).to be > 2
		end

		it "should return hot score < 1, 1 day later, 0 ups, 5 downs" do
			thursday = Time.local(2014, 8, 14)
			expect(@image.hot(0, 5, thursday)).to be < 1
		end

		it "should return hot score < 0, 1 day later, 0 ups, 20 downs" do
			thursday = Time.local(2014, 8, 14)
			expect(@image.hot(0, 20, thursday)).to be < 0
		end
	end
end