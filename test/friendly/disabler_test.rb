require 'test_helper'

class Friendly::Disabler::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Friendly::Disabler
  end

  test "enable/disable works" do
    assert_equal Friendly::Disabler::friendly_id_disabled?, false

    Friendly::Disabler::friendly_id_disable!
    assert_equal Friendly::Disabler::friendly_id_disabled?, true

    Friendly::Disabler::friendly_id_enable!
    assert_equal Friendly::Disabler::friendly_id_disabled?, false
  end

  test 'it return original id for models disabled' do
    model = DummyBlog.create(title: 'Test title')

    assert_equal 'test-title', model.to_param

    Friendly::Disabler::friendly_id_disable!

    assert_equal model.id.to_s, model.to_param
  end

  test 'it return original id for block' do
    model = DummyBlog.create(title: 'Test title')
    assert_equal 'test-title', model.to_param

    result_id = nil

    Friendly::Disabler::disable_friendly_id do
      result_id = model.to_param
    end

    assert_equal model.id.to_s, result_id
  end
end
