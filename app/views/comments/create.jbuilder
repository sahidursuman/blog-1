json.meta do
end
json.comment do
  json.comment @comment.comment
  json.created_at @comment.created_at
  json.created_at_local l(@comment.created_at)
end
