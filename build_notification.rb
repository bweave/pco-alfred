#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class BuildNotification
  def initialize(output:, selected_action:, selected_app:)
    @output = output
    @selected_action = selected_action
    @selected_app = selected_app
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

  attr_reader :output, :selected_action, :selected_app

  def notification
    case selected_action
    when /idle/
      idle_message
    when "open"
      "🕸 Open #{selected_app.capitalize} in browser"
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
    icon = selected_action == "prevent-idle" ? "☕️" : "😴"
    "#{icon} #{selected_action.gsub("-", " ").capitalize} for #{selected_app.capitalize} complete"
  end

  def restart_app_message
    "🔄 #{selected_app.capitalize} restarted"
  end

  def check_version_message
    return "❗️ Update available" if output.include?("update")

    # yep, it's a gross regex to remove ansi colors from the output
    output.gsub(/(\e\[\w+)?\e\[[\w;]+m/, "").split("\r").last.gsub(/\n/, "")
  end
end


$stdout.puts(BuildNotification.new(
  output: ENV.fetch("output"),
  selected_action: ENV.fetch("selected_action"),
  selected_app: ENV.fetch("selected_app", nil)
).to_json)
