class ApplicationController < ActionController::API
  after_action :set_version_header

  protected
    def set_version_header
      response.set_header("Access-Control-Allow-Origin", "*")
    end
end
