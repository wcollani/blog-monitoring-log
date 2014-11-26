#!/usr/bin/env ruby
#
# Check NTP offset - yeah this is horrible.
#
# warning and critical values are offsets in milliseconds.
#

require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'

class CheckNTP < Sensu::Plugin::Check::CLI

  option :warn,
    :short => '-w WARN',
    :proc => proc {|a| a.to_i },
    :default => 10

  option :crit,
    :short => '-c CRIT',
    :proc => proc {|a| a.to_i },
    :default => 100

  def run
    begin
      offset = `ntpq -c "rv 0 offset"`.split('=')[1].strip.to_i
    rescue
      unknown "NTP command Failed"
    end

    puts "NTP offset = #{offset}"

    critical if offset >= config[:crit] || offset <= -config[:crit]
    warning if offset >= config[:warn] || offset <= -config[:warn]
    ok

  end
end
