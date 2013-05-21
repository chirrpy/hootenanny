module Hootenanny
  class Engine < ::Rails::Engine
    isolate_namespace Hootenanny

    initializer "model_core.factories", :after => "factory_girl.set_factory_paths" do
      FactoryGirl.definition_file_paths << File.expand_path('../../../../spec/factories', __FILE__) if defined?(FactoryGirl)
    end
  end
end
