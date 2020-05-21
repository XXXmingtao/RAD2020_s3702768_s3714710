module PostsHelper
    def post_created_time(post)
        post.created_at.in_time_zone("Melbourne").strftime("%Y-%m-%d %T")
    end

    def post_created_date(post)
        post.created_at.in_time_zone("Melbourne").strftime("%Y-%m-%d")
    end

    def title_for(post)
        if post
            post.title
        else
            "[Deleted]"
        end
    end
end
