module ApplicationHelper
    
    def popular_topics
        topics = Hash.new
        Post.all.each do |post|
            if topics.key?(post.topic)
            topics[post.topic]+=post.view
            else
            topics[post.topic] = post.view
            end
        end
        return topics.sort_by {|k,v| v}.reverse.first 2
    end
end
