class Like < ApplicationRecord
  belongs_to :message
  belongs_to :user
  # validates_uniqueness_of :message_id, scope: :user_id
  
end
