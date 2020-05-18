module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
<<<<<<< HEAD
=======

    def gravatar_for_head(user, options = { size: 80 })
    
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            size = options[:size]
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
            image_tag(gravatar_url, alt: user.name, class: "gravatarhead")

    end

    def user_created_time(user)

        content_tag(:span, user.created_at.in_time_zone("Melbourne").strftime("%Y-%m-%d"))
    end

>>>>>>> origin/profilework
end
