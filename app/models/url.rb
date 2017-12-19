class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_create :shorten_url
	validates :long_url, format: { with: /(http:\/\/)?(https:\/\/)?www.+/, message: "Please enter valid URL"}

	def shorten_url
		# store= ("A".."z").to_a + ("0".."9").to_a
		# str = ""
		# 6.times do
		# 	 str += store.sample
		# end
		# self.short_url = str

		#this is the shortest way to get random number
		self.short_url =  SecureRandom.hex(4)
	end

end
