require 'net/ssh'

namespace :rbenv do
  task install: :environment do
    Net::SSH.start( '52.231.67.91', 'kbs4674', :keys => "../azure_key.pem" ) do |ssh|
      ssh.exec!("source ~/.bash_profile")
      ssh.exec!("source ~/.bashrc")
      ssh.exec!("ruby -v")
    end
  end
end