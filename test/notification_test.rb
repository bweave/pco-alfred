require "test_helper"
require "notification"

class NotificationTest < Minitest::Test
  def output
    @output ||= ""
  end

  def app
    @app ||= "groups"
  end

  def action
    @action ||= "prevent-idle"
  end

  def subject
    JSON.parse Notification.new(output: output, action: action, app: app).to_json
  end

  def notification
    subject.dig("alfredworkflow", "arg")
  end

  def test_to_json_provides_the_required_data
    assert notification
  end

  def test_prevent_idle
    @action = "prevent-idle"
    assert_equal "☕️ Prevent idle for Groups complete", notification
  end

  def test_allow_idle
    @action = "allow-idle"
    assert_equal "😴 Allow idle for Groups complete", notification
  end

  def test_open_in_browser
    @action = "open"
    assert_equal "🕸 Open #{app.capitalize} in browser", notification
  end

  def test_box_start
    @action = "start"
    assert_equal "🏁 PCO Box started", notification
  end

  def test_box_stop
    @action = "stop"
    assert_equal "🛑 PCO Box stoped", notification
  end

  def test_box_restart
    @action = "restart"
    assert_equal "🔄 PCO Box restarted", notification
  end

  def test_box_restart_app
    @action = "restart-app"
    assert_equal "🔄 Groups restarted", notification
  end

  def test_box_restart_nginx
    @action = "restart-nginx"
    assert_equal "🔄 Nginx restarted", notification
  end

  def test_check_version
    @action = "check-version"

    @output = "You're up to date"
    assert_equal output, notification

    @output = "Update available"
    assert_equal "❗️ Update available", notification
  end

  def test_fallback_notification
    @action = "Some other action"
    assert_equal "👌 Make dope choices.", notification
  end
end

