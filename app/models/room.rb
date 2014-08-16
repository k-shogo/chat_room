class Room < ActiveRecord::Base
  has_many :messages, dependent: :delete_all
end
