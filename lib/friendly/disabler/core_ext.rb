class ApplicationRecord
  def to_param
    ::Friendly::Disabler.friendly_id_disabled? ? (id && id.to_s) : super
  end
end
