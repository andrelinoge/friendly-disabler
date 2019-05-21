module Friendly
  module Disabler
    module ActiveRecordExtension
      def unfriendly
        result = self
        def result.friendly_id_config
          OpenStruct.new(routes: "disabled")
        end

        result
      end
    end
  end
end
