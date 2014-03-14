json.meta do
  json.current_page @posts.current_page
  json.total_pages @posts.total_pages
end
json.posts do
  json.array! @posts do |post|
    json.title post.title
    json.url post_path(post, format: :json)
    json.copy post.copy
    json.pub_date post.pub_date
    json.pub_date_local l(post.pub_date)
    json.has_more_comments (post.comments.count > 3)
    json.comments_url post_comments_path(post, format: :json)
    json.tags do
      json.array! post.tags do |tag|
        json.name tag.name
        json.url tag_path(tag, format: :json)
      end
    end
    json.comments do
      json.array! post.comments.ordered.limit(3),
        partial: 'comments/comment',
        as: :comment
    end
  end
end
