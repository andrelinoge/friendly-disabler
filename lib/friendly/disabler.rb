require "friendly/disabler/railtie"
require "friendly/disabler/version"

module Friendly
  module Disabler
    FD_THREAD_KEY = :__friendly_disabler_state

    class << self

      def friendly_id_disable!
        RequestStore.store[FD_THREAD_KEY] = true
      end

      def friendly_id_enable!
        RequestStore.store[FD_THREAD_KEY] = false
      end

      def friendly_id_disabled?
        RequestStore.store[FD_THREAD_KEY] ||= false
        !!RequestStore.store[FD_THREAD_KEY]
      end

      def disable_friendly_id(&block)
        begin
          old_value = Thread.current[FD_THREAD_KEY]
          RequestStore.store[FD_THREAD_KEY] = true

          block.call
        ensure
          RequestStore.store[FD_THREAD_KEY] = old_value
        end
      end
    end
  end
end
