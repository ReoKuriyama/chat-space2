class Group < ApplicationRecord
  # Association
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  # Validation
  validates :group_name, presence: true

  def last_message_body
    if messages.last
      message_last
    else
      'No message'
    end
  end

  def message_last
    messages.last.try!(:body) || 'image was uploaded'
  end
end
