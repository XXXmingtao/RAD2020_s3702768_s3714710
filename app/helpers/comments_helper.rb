module CommentsHelper
    def comment_created_time(comment)
        comment.created_at.in_time_zone("Melbourne").strftime("%Y-%m-%d %T")
    end

    def comment_created_date(comment)
        comment.created_at.in_time_zone("Melbourne").strftime("%Y-%m-%d")
    end
end
