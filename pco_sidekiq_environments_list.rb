#!/usr/bin/env ruby
# encoding: utf-8

require_relative "lib/pco_sidekiq_app_environments"

selected_app = ENV.fetch("selected_app")
$stdout.puts(PcoSidekiqAppEnvironments.new(app: selected_app).to_json)
