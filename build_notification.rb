#!/usr/bin/env ruby
# encoding: utf-8

require_relative "lib/notification"

output = ENV.fetch("output")
action = ENV.fetch("selected_action")
app = ENV.fetch("selected_app", nil)
$stdout.puts(Notification.new(output: output, action: action, app: app).to_json)
