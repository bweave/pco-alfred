#!/usr/bin/env ruby
# encoding: utf-8

require_relative "lib/command"

box_command = ARGV[0]
$stdout.puts(Command.run(command: box_command).to_json)
