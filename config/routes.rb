Hootenanny::Engine.routes.draw do
  resource :subscription, :only => :create
end
