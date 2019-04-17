require "friendly/disabler/railtie"
require "friendly/disabler/core_ext"

module Friendly
  module Disabler
    FD_THREAD_KEY = :__friendly_disabler_state

    class << self

      def friendly_id_disable!
        Thread.current[FD_THREAD_KEY] = true
      end

      def friendly_id_enable!
        Thread.current[FD_THREAD_KEY] = false
      end

      def friendly_id_disabled?
        !!Thread.current[FD_THREAD_KEY]
      end

      def disable_friendly_id(&block)
        begin
          old_value = Thread.current[FD_THREAD_KEY]
          Thread.current[FD_THREAD_KEY] = true

          block.call
        ensure
          Thread.current[FD_THREAD_KEY] = old_value
        end
      end
    end
  end
end
