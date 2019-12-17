require "test_helper"
require "app_command"

class AppCommandTest < Minitest::Test
  def app
    @app ||= "groups"
  end

  def box
    "~/pco-box/bin/box"
  end

  def action
    @action ||= "prevent-idle"
  end

  def subject
    JSON.parse AppCommand.new(app: app, box: box, action: action).to_json
  end

  def test_to_json_provides_the_required_data
    assert_includes subject.keys, "alfredworkflow"
    assert subject.dig("alfredworkflow", "arg")
    assert subject.dig("alfredworkflow", "variables", "selected_app")
  end

  def test_building_commands
    expected = "#{box} #{action} --app #{app}"
    assert_equal expected, subject.dig("alfredworkflow", "arg")

    @action = "allow-idle"
    expected = "#{box} #{action} --app #{app}"
    assert_equal expected, subject.dig("alfredworkflow", "arg")

    @action = "open"
    expected = "cd ~/Code/#{app} && #{box} #{action}"
    assert_equal expected, subject.dig("alfredworkflow", "arg")

    @action = "restart-app"
    expected = "cd ~/Code/#{app} && #{box} #{action}"
    assert_equal expected, subject.dig("alfredworkflow", "arg")
  end

  def test_fails_for_unknown_action
    @action = "nope"
    assert_raises { subject }
  end
end
