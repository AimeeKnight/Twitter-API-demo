require 'twitter'
require 'yaml'

CONFIG = YAML.load_file("config.yml")

Twitter.configure do |config|
  CONFIG['twitter'].each_key do |key|
   #config.consumer_key = val
   #setter method names end with =
    config.send("#{key}=", CONFIG['twitter'][key])
  end
end

tweeter_id = gets.chomp
tweeter = Twitter.user(tweeter_id)
puts tweeter