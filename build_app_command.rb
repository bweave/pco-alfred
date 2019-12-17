#!/usr/bin/env ruby
# encoding: utf-8

require_relative "lib/app_command"

app = ARGV[0]
box = ENV.fetch("box")
selected_action = ENV.fetch("selected_action")
$stdout.puts(AppCommand.new(app: app, box: box, action: selected_action).to_json)
