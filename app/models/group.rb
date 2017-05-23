class Group < ApplicationRecord

# Association
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

#Validation
  validates :group_name, presence: true

end
