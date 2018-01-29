# frozen_string_literal: true

require 'record_medium/version'
require 'record_medium/import'
require 'record_medium/export'
require 'httparty'
require 'digest'

# RecordMedium API public methods
module RecordMedium
  def self.add(key: nil, data: nil)
    Import.new(key).add(data)
  end

  def self.set(key: nil, data: nil)
    Import.new(key).set(data)
  end

  def self.iframe(data)
    Export.new(data).iframe
  end

  def self.url(data)
    Export.new(data).url
  end
end
