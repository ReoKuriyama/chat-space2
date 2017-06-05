class Group < ApplicationRecord

# Association
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

#Validation
  validates :group_name, presence: true

  def last_message_body
    messages.last ? messages.last.body : "no message"
  end
end
