class Account
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String

  has_many :messages
  has_and_belongs_to_many :logins

  validates :email, presence:true, uniqueness: true
end
