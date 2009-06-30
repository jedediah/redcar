
require 'pp'
require 'fileutils'
require 'open3'
require 'open4'
require 'tempfile'
require 'uri'
require 'cgi'

# GTK dependencies
require 'gtk2'
require 'gconf2'

$:.push(File.expand_path(File.dirname(__FILE__) + "/../vendor/zerenity/lib"))
require 'zerenity'

# RubyGem dependencies
if RUBY_VERSION >= "1.9"
  module Oniguruma
    ORegexp = ::Regexp
  end
else
  require 'rubygems'
  require 'oniguruma'
end

ORegexp = Oniguruma::ORegexp

module Oniguruma #:nodoc:
  class ORegexp #:nodoc:
    def _dump(_)
      self.source
    end

    if RUBY_VERSION < '1.9'
      def self._load(str)
        self.new(str, :options => Oniguruma::OPTION_CAPTURE_GROUP)
      end
    else
      def self._load(str)
        self.new(str)
      end

      [:sub,:sub!,:gsub,:gsub!].each do |meth|
        define_method meth do |s, &b|
          s.sub self, &b
        end
      end
    end # if RUBY_VERSION <= '1.9'
  end
end

# require 'test/unit'

require 'active_support/vendor'
require 'active_support/basic_object'
require 'active_support/duration'
require 'active_support/core_ext'
require 'active_support/multibyte'

