require 'net/ssh'

namespace :rbenv do
  task install: :environment do
    Net::SSH.start( '52.231.67.91', 'kbs4674', :keys => "../azure_key.pem" ) do |ssh|
      ssh.exec!("cat ~/junction/shared/config/server_init/work.txt")
    end
  end
end