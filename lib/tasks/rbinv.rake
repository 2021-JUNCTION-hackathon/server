require 'net/ssh'

namespace :rbenv do
  task install: :environment do
    Net::SSH.start( '52.231.103.181', 'kbs4674', :keys => "../azure_key.pem" ) do |ssh|
      ssh.exec!("echo `bash ./junction/shared/config/server_init/init_rbenv.sh`")
    end
  end
end