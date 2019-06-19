require 'friendly/disabler/active_record_extension'

module Friendly
  module Disabler
    class Railtie < ::Rails::Railtie
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.include Friendly::Disabler::ActiveRecordExtension

        if defined? FriendlyId::Model
          FriendlyId::Model.module_eval do
            alias :friendly_to_param :to_param

            def to_param
              ::Friendly::Disabler.friendly_id_disabled? ? (id && id.to_s) : friendly_to_param
            end
          end
        end
      end

      ActiveSupport.on_load(:action_controller_base) do
      end

      ActiveSupport.on_load(:action_controller_api) do
      end

    end
  end
end
