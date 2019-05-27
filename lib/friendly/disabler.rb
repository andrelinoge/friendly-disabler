require "friendly/disabler/railtie"
require "friendly/disabler/version"

module Friendly
  module Disabler
    @@friendly_disabler_state = false

    class << self

      def friendly_id_disable!
        @@friendly_disabler_state = true
      end

      def friendly_id_enable!
        @@friendly_disabler_state = false
      end

      def friendly_id_disabled?
        @@friendly_disabler_state
      end

      def disable_friendly_id(&block)
        begin
          old_value = @@friendly_disabler_state
          @@friendly_disabler_state = true

          block.call
        ensure
          @@friendly_disabler_state = old_value
        end
      end
    end
  end
end
