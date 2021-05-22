namespace :rbenv do
  task install: :environment do
    Net::SSH.start( '52.231.103.181', 'kbs4674', :keys => "../azure_key.pem" ) do |ssh|
      ssh.exec!("git clone git://github.com/sstephenson/rbenv.git .rbenv")
      ssh.exec!("git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build")
      ssh.exec!("")
      ssh.exec!("")
    end
  end
end