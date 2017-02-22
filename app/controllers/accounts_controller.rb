class AccountsController < ApplicationController

  skip_before_action :authenticate_login!

  def index
    @accounts = Account.nin(_id: current_login.accounts.map(&:id))
  end

  def new
    @new_user_sign_up = UserSignUp.new
    if @new_user_sign_up.save
      sign_in(@new_user_sign_up.login)
    end

  end

  def create
  end
end
