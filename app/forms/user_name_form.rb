class UserNameForm
  include ActiveModel::Model

  attr_accessor :name

  validates :name, presence: true, length: {maximum: 32}
end
