#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class AppCommand
  def initialize(app:, box:, action:)
    @app = app
    @box = box
    @action = action
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

  attr_reader :app, :box, :action

  def box_command
    case action
    when /idle/
      "#{box} #{action} --app #{app}"
    when "open", "restart-app"
      "cd ~/Code/#{app} && #{box} #{action}"
    else
      fail "WAT?!?!"
    end
  end
end

