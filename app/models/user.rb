class User < ActiveRecord::Base
      
      has_many :reviews
      has_many :friends
      
      # Skapar en ny användare
      def self.from_omniauth(auth)
          where(auth.slice(:provider, :uid)).first_or_create do |user|
      		user.provider = auth.provider
      		user.uid = auth.uid
      		user.name = auth.info.name
      		user.email = auth.info.email
      		user.image = auth.info.image
      		user.location = auth.info.location
      		user.gender = auth.extra.raw_info.gender
      		user.urls = auth["info"]["urls"]["Facebook"]
      		user.oauth_token = auth.credentials.token
      		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      		
                  user.save!
                  user.add_friends
      	  end	
	    end
      
      # Hämtar användarens vänner
      def add_friends
            friends_data = facebook.get_connections("me", "friends", :fields => "id, name, link, picture, gender")
            friends_data.map do |h|
                  friend = Friend.new
                  friend.uid = h["id"]
                  friend.name = h["name"]
                  friend.image = h["picture"]["data"]["urls"]
                  friend.gender = h["gender"]
                  friend.urls = h["link"]
                  friend.user_id = self.id
            friend.save!
            end
      end

      # Hämta användaren vänners checkins
      def get_friends_checkins
            if (!h["checkins"].blank?)
             checkin = Checkin.new
             checkin.checkin_id = h["id"]
             checkin.user_id = h["checkins"]["data"]["from"]["id"] 
             checkin.user_name = h["checkins"]["data"]["from"]["name"] 
             checkin.tags = h["checkins"]["tags"]["data"]["name"]
             checkin.place_id = h["checkins"]["place"]["id"]
             checkin.place_name = h["checkins"]["place"]["name"]
             checkin.message = h["checkins"]["message"]
             checkin.created_time = h["checkins"]["created_time"]
             checkin.friend_id = friend.id
             checkin.save!
            end
      end

      # Dela recensionen till facebook 
      def self.share_review(user_id, school_url)
        user = User.find(user_id)
        user.facebook.put_connections("me", "allatrafikskolor:review", driving_school: school_url)
      end

  
  # Antalet checkins på facebook
  def count_checkins(name,id)
     query = self.facebook.fql_query('SELECT checkins FROM page WHERE name = "' + name + '"')
     
     if query[0].nil?
        zero_checkins = 0
        Checkin.create!(:checkin_count => zero_checkins, :school_id => id)
        puts "Saved: #{name} - checkin: 0"
     else 
        checkins = query[0]["checkins"]
        Checkin.create!(:checkin_count => checkins, :school_id => id)
        puts "Saved: #{name} - checkin : #{checkins}"
     end

  end

  # Antalet likes på facebook
  def count_likes(name,id)
     query = self.facebook.fql_query('SELECT fan_count FROM page WHERE name = "' + name +'"')
     
     if query[0].nil?
        zero_likes = 0
        Likes.create!(:fan_count => zero_likes, :school_id => id)
        puts "Saved: #{name} - likes: 0"
     else
        likes = query[0]["fan_count"]
        Likes.create!(:fan_count => likes, :school_id => id)
        puts "Saved: #{name} - likes: #{likes}"
     end
     
  end
  
  # Skapa ett access token anrop, spara det i en instance variabel
  def facebook
      @facebook ||= Koala::Facebook::API.new(oauth_token)
  end
end
