#!/usr/bin/env ruby
# encoding: utf-8

require "open3"
require "json"

class RunPcoBoxCommand
  def initialize(box_command:)
    @box_command = box_command
    @output, @err, @status = Open3.capture3(box_command)
  end

  def to_json
    {
      alfredworkflow: {
        arg: status.to_i,
        variables: { # helpful for debugging
          output: output,
          err: err,
          status: status,
        },
      },
    }.to_json
  end

  private

  attr_reader :box_command, :output, :err, :status
end

box_command = ARGV[0]
$stdout.puts(RunPcoBoxCommand.new(box_command: box_command).to_json)
