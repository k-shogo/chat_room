class Message < ActiveRecord::Base
  belongs_to :room
  scope :newer, -> {order(created_at: :desc)}
end
