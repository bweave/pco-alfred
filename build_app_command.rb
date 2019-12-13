#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class BuildAppCommand
  def initialize(app:, box:, selected_action:)
    @app = app
    @box = box
    @selected_action = selected_action
  end

  def to_json
    {
      alfredworkflow: {
        arg: box_command,
        variables: { selected_app: app },
      },
    }.to_json
  end

  private

  attr_reader :app, :box, :selected_action

  def box_command
    case selected_action
    when /idle/
      "#{box} #{selected_action} --app #{app}"
    when "open", "restart-app"
      "cd ~/Code/#{app} && #{box} #{selected_action}"
    else
      fail "WAT?!?!"
    end
  end
end

app = ARGV[0]
box = ENV.fetch("box")
selected_action = ENV.fetch("selected_action")
$stdout.puts(BuildAppCommand.new(app: app, box: box, selected_action: selected_action).to_json)
