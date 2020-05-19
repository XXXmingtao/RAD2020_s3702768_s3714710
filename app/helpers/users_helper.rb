module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        size = options[:size]
        if user
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
            image_tag(gravatar_url, alt: user.name, class: "gravatar")
        else
            image_tag("anonymous.png", size:size, alt: "deleted", class: "gravatar")
        end
    end

    def name_for(user)
        if user
            user.name
        else
            "[Deleted]"
        end
    end

    def user_created_time(user)
        content_tag(:span, user.created_at.in_time_zone("Melbourne").strftime("%Y-%m-%d"))
    end

end
