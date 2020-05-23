module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        size = options[:size]
        if user
            if user.avatar.attached?
                image_tag(url_for(user.avatar), alt: user.name, class: "gravatar", id:'img-preview')
            else
                gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
                gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
                image_tag(gravatar_url, alt: user.name, class: "gravatar")
            end
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

    def address_for(user)
        if user.address
            user.address
        else
            "Other"
        end
    end

end
