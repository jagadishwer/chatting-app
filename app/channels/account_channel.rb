class AccountChannel < ApplicationCable::Channel
  def subscribed
    stream_for "account_#{current_login.accounts.first.id.to_s}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end


