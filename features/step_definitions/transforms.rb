Transform /^\/.*$/ do |x|
	@server_root + x
end

Transform /^\d+$/ do |x|
	x.to_i
end

