get '/' do
	# the erb state the path to the html file
	erb :"static/index"
end

post '/submit' do
	
	b=Url.find_by(long_url: params[:URL])

	if ((/https:\/\// =~ params[:URL]) == nil)
		params[:URL] = "https://"+ params[:URL]
	end
	
	if ( b.nil? )
		
		@url = Url.new(long_url: params[:URL])
		@url.shorten_url
		if @url.save		
			# redirect '/home'
			# {url: @url.to_json(only: [:long_url, :short_url, :count]), saved:true}.to_json
			{long_url: @url.long_url, short_url:@url.short_url, count:@url.count, saved:true}.to_json
			# {short_url: @url.short_url}.to_json
		else
			{saved:false}.to_json
		end

	else
		redirect '/'
	end


	

end

get '/:short_url' do
	a=Url.find_by(short_url: params[:short_url])
	# @link=a.short_url
	a.count+=1
	a.save
	redirect a.long_url
	# if ((/https:\/\// =~ a.long_url) == nil)
	# 	redirect "https://"+a.long_url
	# else
	# 	redirect a.long_url
	# end
end

# post '/delete' do
# 	a=Url.all
# 	a.delete_all
# 	redirect '/'
# end