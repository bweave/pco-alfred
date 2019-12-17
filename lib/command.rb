#!/usr/bin/env ruby
# encoding: utf-8

require "open3"
require "json"

class Command
  def self.run(command:)
    new(command: command)
  end

  def initialize(command:)
    @command = command
    # TODO: it might be nice to move this out of initialize?
    @output, @err, @status = Open3.capture3(command)
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

  attr_reader :command, :output, :err, :status
end

