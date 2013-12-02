require 'rubygems'
require 'interactive_editor'

if IRB.version.include?('DietRB') #Macruby specific starters
    framework 'cocoa'
    require 'irb/ext/colorize'
    IRB.formatter.color_scheme = :dark_background
    IRB.formatter.prompt = :simple
else
    begin
        require 'wirble'
        Wirble.init
        Wirble.colorize
    rescue
        warn "Couldn't load Wirble: #{err}"
    end
    IRB.conf[:PROMPT_MODE] = :SIMPLE
end
