require "friendly/disabler/railtie"
require "friendly/disabler/core_ext"

module Friendly
  module Disabler
    THREAD_LOCAL_KEY = :__friendly_disabler_state

    class << self

      # Return true if friendly_id is currently disabled
      def friendly_id_disabled?
        !!Thread.current[THREAD_LOCAL_KEY]
      end

      # Run a block with friendly id disabled
      def disable_friendly_id(&block)
        begin
          old_value = Thread.current[THREAD_LOCAL_KEY]
          Thread.current[THREAD_LOCAL_KEY] = true

          block.call
        ensure
          Thread.current[THREAD_LOCAL_KEY] = old_value
        end
      end
    end
  end
end
