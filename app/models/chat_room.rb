class ChatRoom
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :messages

  field :p, as: :participants, type: Array

  #TODO need write custom validation to validate participants array uniqueness
  #TODO need to remove as it is not for now

end
