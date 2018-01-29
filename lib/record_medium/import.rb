# frozen_string_literal: true

module RecordMedium
  # Import methods
  class Import
    HOST  = 'https://recordmedium.com'
    API   = 'v1'

    def initialize(key)
      @key = key
      raise ArgumentError, 'No key' unless @key
    end

    def add(data)
      HTTParty.post("#{HOST}/api/#{API}/records/#{@key}/add", data_params(data))
    end

    def set(data)
      HTTParty.post("#{HOST}/api/#{API}/records/#{@key}/set", data_params(data))
    end

    def data_params(data)
      {
        body: {
          data: data.to_json
        }
      }
    end
  end
end
