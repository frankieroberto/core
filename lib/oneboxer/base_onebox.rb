require 'open-uri'

module Oneboxer

  class BaseOnebox

    class << self
      attr_accessor :regexp
      attr_accessor :favicon_file

      def matcher(regexp)
        self.regexp = regexp
      end

      def favicon(favicon_file)
        self.favicon_file = "favicons/#{favicon_file}"
      end

      def remove_whitespace(s)
        s.gsub /\n/, ''
      end

      def image_html(url, title, page_url)
        "<a href='#{page_url}' target='_blank'><img src='#{url}' alt='#{title}'></a>"
      end

      def replace_tags_with_spaces(s)
        s.gsub /<[^>]+>/, ' '
      end

      def uriencode(val)
        return URI.escape(val, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
      end

    end

    def initialize(url, opts={})
      @url = url     
      @opts = opts
    end

    def translate_url
      @url
    end

  end

end
