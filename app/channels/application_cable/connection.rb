module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_login

    def connect
      self.current_login = find_verified_login
    end

    protected

    def find_verified_login
      if current_login = Login.find_by(id: cookies.signed[:login_id])
        current_login
      else
        reject_unauthorized_connection
      end
    end

  end
end
