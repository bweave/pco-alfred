#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class PcoBoxActions
  ACTIONS = [
    { name: "Allow Idle", desc: "Choose an app to allow idle", value: "allow-idle" },
    { name: "Background Logs", desc: "Tail AllTheProcfiles logs in a new iTerm tab", value: "bg-log" },
    { name: "Check Version", desc: "Check your installed PCO Box version", value: "check-version" },
    { name: "Open local App in Browser", desc: "Chooose an app to open in your browser", value: "open" },
    { name: "Prevent Idle for App", desc: "Choose an app to prevent idle", value: "prevent-idle" },
    { name: "Restart", desc: "Restart PCO Box", value: "restart" },
    { name: "Restart App", desc: "Choose an app to restart", value: "restart-app" },
    { name: "Restart Nginx", desc: "Restart Nginx", value: "restart-nginx" },
    { name: "Start", desc: "Start PCO Box", value: "start" },
    { name: "Stop", desc: "Stop PCO Box", value: "stop" },
  ].freeze

  def self.to_json
    new.to_json
  end

  def initialize
    @actions = ACTIONS.map { |action| build_action_hash(action) }
  end

  def to_json
    { items: actions }.to_json
  end

  private

  attr_reader :actions

  def build_action_hash(action)
    {
      uid: "",
      title: action[:name],
      subtitle: action[:desc],
      arg: action[:value],
      valid: "yes",
    }
  end
end

