json.array! @messages do |message|
  json.name message.user.name
  json.time message.created_at
  json.image message.image_url
  json.body message.body
end
