require 'date'

module Hotness
	START_DATE = Time.local(2014, 8, 13)

	def seconds_from_start_date(date)
		(date.to_i - START_DATE.to_i).to_f
	end

	def hot(ups, downs, date)
		score = ups - downs
		displacement = Math.log([score.abs, 1].max, 10)

		if score >= 0
			sign = 1
		elsif score < 0
			sign = -1
		end

		return (displacement * sign.to_f) + (seconds_from_start_date(date) / 86400)

	end

end