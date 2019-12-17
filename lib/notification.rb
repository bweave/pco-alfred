#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class Notification
  def initialize(output:, action:, app:)
    @output = output
    @action = action
    @app = app
  end

  def to_json
    {
      alfredworkflow: {
        arg: notification,
        variables: {},
      },
    }.to_json
  end

  private

  attr_reader :output, :action, :app

  def notification
    case action
    when /idle/
      idle_message
    when "open"
      "🕸 Open #{app.capitalize} in browser"
    when "start"
      "🏁 PCO Box started"
    when "stop"
      "🛑 PCO Box stoped"
    when "restart"
      "🔄 PCO Box restarted"
    when "restart-app"
      restart_app_message
    when "restart-nginx"
      "🔄 Nginx restarted"
    when "check-version"
      check_version_message
    else
      "👌 Make dope choices."
    end
  end

  def idle_message
    icon = action == "prevent-idle" ? "☕️" : "😴"
    "#{icon} #{action.gsub("-", " ").capitalize} for #{app.capitalize} complete"
  end

  def restart_app_message
    "🔄 #{app.capitalize} restarted"
  end

  def check_version_message
    return "❗️ Update available" if output.downcase.include?("update")

    # yep, it's a gross regex to remove ansi colors from the output
    output.gsub(/(\e\[\w+)?\e\[[\w;]+m/, "").split("\r").last.gsub(/\n/, "")
  end
end

