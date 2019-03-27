class ApplicationController < ActionController::Base
    before_action :initialize_cart_session

    private
    def initialize_cart_session
        session[:cart] ||= []
    end
end
