namespace :facebook do
	desc "Get checkins for each School"
	task :checkins => :environment do
	    require 'koala'
	    user = User.first
	    School.all.each do |column|
	    	user.count_checkins(column.name, column.id)
	    end
	end

	desc "Get likes for each School"
	task :likes => :environment do
		require 'koala'
		user = User.first
		School.all.each do |column|
			user.count_likes(column.name, column.id)
		end
	end

	desc "Start the tasks"
	task :start => [:checkins,:likes]
end