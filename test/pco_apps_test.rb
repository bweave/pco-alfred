require "test_helper"
require "pco_apps"

class PcoAppsTest < Minitest::Test
  def subject
    JSON.parse PcoApps.new.to_json
  end

  def test_to_json_alfred_expects_items
    assert subject.keys.include?("items")
  end

  def test_action_shape
    required_keys = %w(title arg)
    assert(subject["items"].all? { |i| (required_keys - i.keys).empty? })
  end

  def test_uses_app_icon_or_fallback
    all_icon_paths_valid = subject["items"].all? do |i|
      expected_icon_paths = [PcoApps::FALLBACK_ICON_PATH, "img/#{i["arg"]}.png"]
      expected_icon_paths.include?(i.dig("icon", "path"))
    end
    assert all_icon_paths_valid
  end
end

