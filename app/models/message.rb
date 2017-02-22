class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Updated

  field :text

  #it stores the list of user ids, whom can view this message
  field :p, as: :participants, type: Array

  attr_accessor :participant

  belongs_to :account

  validates :text, presence: true
  #TODO: Need to write custom validation check length of an array
  validates :p, presence: true

  after_create :notify_participants
  before_validation :set_paticipants, unless: ->(message){ message.participant.blank?}



  def other_participants
    participants-[account.id]
  end
  def notify_participants
    participants.each do |pa|
    AccountChannel.broadcast_to(
        "account_#{pa.to_s}",
        body: ApplicationController.renderer.render(self, locals:{viewer: pa})
    )
    end

  end

  def set_paticipants
    self.participants = [account_id, BSON::ObjectId.from_string(participant.to_s)]
  end

end
