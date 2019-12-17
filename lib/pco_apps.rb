#!/usr/bin/env ruby
# encoding: utf-8

require "json"

class PcoApps
  APPS = %w(
    Accounts
    Api
    Church-Center
    Giving
    Groups
    Login
    People
    Publishing
    Registrations
    Resources
    Services
  ).freeze

  FALLBACK_ICON_PATH = "img/ruby.png".freeze

  def self.to_json
    new.to_json
  end

  def initialize
    @apps = APPS.map { |app| build_app_hash(app) }
  end

  def to_json
    { items: apps }.to_json
  end

  private

  attr_reader :apps

  def build_app_hash(app)
    {
      uid: "",
      title: app,
      subtitle: "",
      icon: { path: app_icon_path(app) },
      arg: app.downcase,
      valid: "yes",
    }
  end

  def app_icon_path(app)
    app_icon_path = "img/#{app.downcase}.png"
    File.exist?(app_icon_path) ? app_icon_path : FALLBACK_ICON_PATH
  end
end
