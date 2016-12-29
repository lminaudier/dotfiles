require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# 25 entries in the list
IRB.conf[:SAVE_HISTORY] = 100

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

require 'pp'
IRB.conf[:AUTO_INDENT]=true
$: << '.' # Seriously, ruby this should be default

begin
  require "awesome_print"
  AwesomePrint.irb!
rescue LoadError
end

begin
  require "rubygems"
  require 'pry'
  Pry.start
  exit
rescue LoadError
end
