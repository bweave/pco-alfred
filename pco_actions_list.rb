#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class PcoActionsList
  ACTIONS = [
    { name: "Box", desc: "Planning Center local dev environment", value: "box", icon: "icon.png" },
    { name: "API Docs", desc: "Planning Center API docs", value: "https://developer.planning.center/docs", icon: "icon.png" },
    { name: "VictorOps", desc: "For all your developer on-call needs", value: "https://portal.victorops.com/client/planning-center", icon: "img/victorops.jpg" },
    { name: "Sidekiq", desc: "Every hero needs a trusty sidekiq", value: "sidekiq", icon: "img/sidekiq.png" },
    { name: "Picodex", desc: "Planning Center rolodex, get it?", value: "https://picodex.pco.bz", icon: "icon.png" },
    { name: "Lunchbox", desc: "🥪 🌮 🍕" ,value: "https://lunchbox.pco.bz", icon: "icon.png" },
    { name: "Datadog", desc: "We haz logs!", value: "https://app.datadoghq.com", icon: "img/datadog.png" },
    { name: "Bugsnag", desc: "🐛🐛🐛 🔨", value: "https://app.bugsnag.com", icon: "img/bugsnag.png" },
    { name: "Expensify", desc: "Track your expenses", value: "https://www.expensify.com/inbox", icon: "img/expensify.png" },
    { name: "ADP MyADP", desc: "", value: "https://my.adp.com/static/redbox/login.htmll", icon: "img/adp.png" },
    { name: "ADP TotalSource", desc: "", value: "https://online.adp.com/totalsource/login.html", icon: "img/adp.png" },
    { name: "Bamboo", desc: "", value: "https://pco.bamboohr.com/home/", icon: "img/bamboo.png" },
    { name: "Betterment", desc: "", value: "https://wwws.betterment.com/app/summary", icon: "img/betterment.png" },
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
      icon: { path: action[:icon] },
      arg: action[:value],
      valid: "yes",
    }
  end
end

$stdout.puts(PcoActionsList.to_json)
