class UserSignUp
  include Virtus.model
  include ActiveModel::Validations

  attribute :name,     String
  attribute :email,    String
  attribute :password, String

  attr_accessor :login, :account

  validates :email,    presence: true
  validates :password, presence: true
  validates :name,    presence: true

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def login
    @login ||= {}
  end

  private

  def persist!
    @account = Account.create!(attributes.slice!(:password))
    @login   = @account.logins.create!(attributes.slice(:email, :password))
  end

end