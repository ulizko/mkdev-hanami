module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
      end
    end

    def current_user
      @current_user ||= warden.user
    end

    def warden
      request.env["warden"]
    end

    def authenticate!
      redirect_to "/auth/google_oauth2" unless current_user
    end
  end
end
