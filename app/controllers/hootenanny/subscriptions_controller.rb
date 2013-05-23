require 'hootenanny/hub'

module  Hootenanny
class   SubscriptionsController < ActionController::Base
  def create
    if Hootenanny::Hub.subscribe(params[:callback], to: params[:topic])
      render :nothing => true, :status => :no_content
    end
  end
end
end
