class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none
  # after_action :set_version_header
  #
  # protected
  #   def set_version_header
  #     response.set_header("Access-Control-Allow-Origin", "*")
  #   end
end
