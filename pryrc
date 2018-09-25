Pry.config.editor = 'vim'

def rr!
  Rake.application.instance_variable_get(:@tasks).clear
  load "Rakefile"
end

module Sidekiq
  def self.run!(queue = "default")
    if json = Sidekiq.redis { |r| r.rpop "queue:#{queue}" }
      data = JSON.load(json)
      puts "Running #{data["class"]}"
      data["class"].constantize.new.perform(*data["args"])
    end
  end
end

begin
  # gem install pbcopy
  require "pbcopy"
  rescue LoadError
    GEM_DIR=`gem env gemdir`.strip + "/gems"
    $LOAD_PATH << "#{GEM_DIR}/pbcopy-1.0.1/lib/"
    $LOAD_PATH << "#{GEM_DIR}/pasteboard-1.0/lib/"
    require "pbcopy"
end
