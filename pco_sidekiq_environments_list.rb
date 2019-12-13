#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class PcoSidekiqEnvironmentsList
  ENVIRONMENTS = [
    { name: "Local", value: "http://__app__.pco.test/sidekiq" },
    { name: "Staging", value: "https://__app__-staging.planningcenteronline.com/sidekiq" },
    { name: "Production", value: "https://__app__.planningcenteronline.com/sidekiq" },
  ].freeze

  def initialize(selected_app:)
    @selected_app = selected_app
    @environments = ENVIRONMENTS.map { |env| build_env_hash(env) }
  end

  def to_json
    { items: environments }.to_json
  end

  private

  attr_reader :selected_app, :environments

  def build_env_hash(env)
    {
      uid: "",
      title: env[:name],
      subtitle: "",
      arg: env[:value].gsub("__app__", selected_app),
      valid: "yes",
    }
  end
end

selected_app = ENV.fetch("selected_app")
$stdout.puts(PcoSidekiqEnvironmentsList.new(selected_app: selected_app).to_json)
