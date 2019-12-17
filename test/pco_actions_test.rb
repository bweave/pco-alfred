require "test_helper"
require "pco_actions"

class PcoActionsTest < Minitest::Test
  def subject
    JSON.parse PcoActions.new.to_json
  end

  def test_to_json_alfred_expects_items
    assert subject.keys.include?("items")
  end

  def test_action_shape
    required_keys = %w(title arg)
    assert(subject["items"].all? { |i| (required_keys - i.keys).empty? })
  end
end
