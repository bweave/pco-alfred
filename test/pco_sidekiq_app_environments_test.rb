require "test_helper"
require "pco_sidekiq_app_environments"

class PcoSidekiqAppEnvironmentsTest < Minitest::Test
  def subject
    JSON.parse PcoSidekiqAppEnvironments.new(app: app).to_json
  end

  def app
    @app ||= "groups"
  end

  def test_to_json_alfred_expects_items
    assert subject.keys.include?("items")
  end

  def test_item_shape
    required_keys = %w(title arg)
    assert(subject["items"].all? { |i| (required_keys - i.keys).empty? })
  end

  def test_item_arg_builds_url_to_app_sidekiq
    expected = [
      "http://groups.pco.test/sidekiq",
      "https://groups-staging.planningcenteronline.com/sidekiq",
      "https://groups.planningcenteronline.com/sidekiq",
    ]
    actual = subject["items"].map { |i| i["arg"] }
    assert_equal expected, actual

    # passing in a different app
    @app = "people"
    expected = [
      "http://people.pco.test/sidekiq",
      "https://people-staging.planningcenteronline.com/sidekiq",
      "https://people.planningcenteronline.com/sidekiq",
    ]
    actual = subject["items"].map { |i| i["arg"] }
    assert_equal expected, actual
  end
end
