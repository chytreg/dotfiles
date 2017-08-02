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
    $LOAD_PATH << "~/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/pbcopy-1.0.1/lib/"
    $LOAD_PATH << "~/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/pasteboard-1.0/lib/"
    require "pbcopy"
end
