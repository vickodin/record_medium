# frozen_string_literal: true

module RecordMedium
  # Export methods
  class Export
    HOST = 'https://recordmedium.com'

    def self.sign(data)
      Digest::MD5.hexdigest(
        [
          data[:key], data[:kind], data[:duration],
          (data[:projects] ? data[:projects].join : nil),
          (data[:reports]  ? data[:reports].join  : nil),
          data[:timestamp],
          data[:secret]
        ].join
      )
    end

    def initialize(data)
      @data = data
      @data[:timestamp] ||= Time.now.to_i

      raise ArgumentError, 'No key'    unless @data[:key]
      raise ArgumentError, 'No secret' unless @data[:secret]
    end

    def iframe
      "<iframe width='#{@data[:width]}' height='#{@data[:height]}' src='#{url}'\
        frameborder='0' allowfullscreen></iframe>"
    end

    def url
      "#{HOST}/export/#{@data[:key]}?#{query_string}"
    end

    private

    def query_string
      signed = self.class.sign(@data)
      # drop empty values and convert to query string
      HTTParty::HashConversions.to_params(@data.merge(key: nil, secret: nil)
        .compact
        .merge(sign: signed))
    end
  end
end
