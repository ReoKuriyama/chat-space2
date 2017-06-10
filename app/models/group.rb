class Group < ApplicationRecord

# Association
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

#Validation
  validates :group_name, presence: true

 def last_message_body
    if messages.last
      if messages.last.image?
        return "Image was uploaded"
      else
        messages.last.body
      end
    else
      return "No message"
    end
  end
end
