## config/production.rb

## [Remote 서버 : 아이디] 변수 설정
# AWS EC2 Ubuntu는 기본으로 아이디는 ubuntu 이다.
set :user, 'kbs4674'
## [Example] set :user, 'ubuntu'

## REMOTE 서버 설정
set :remote_server_ip, '20.194.61.63'

## Remote서버에 대해 배포환경 설정 (환경변수 설정)
set :rails_env, 'production'

## Remote서버에서 프로젝트 배포가 이루어질 Path
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

server fetch(:remote_server_ip), port: 22, roles: [:web, :app, :db], primary: true

## SSH Remote 설정 (서버 아이디 및 pem Key 경로 설정)
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w[/home/ubuntu/environment/azure_key.pem] }

# rbenv 설치
# set :rbenv_ruby, '3.0.1'

## swagger 파일 업로드
# cap production deploy:swagger_init
namespace :deploy do
  task :swagger_init do
    on roles(:app) do
      execute "cd ~/#{fetch(:application)}/current/public; mv swagger.tar.gz swagger; cd swagger; tar -xvf swagger.tar.gz"
    end
  end
end

## [Rails Version 5.2 ~] config/application.yml 파일을 EC2 서버로 Upload
# cap production deploy:env_file_upload
namespace :deploy do
  task :env_file_upload do
    on roles(:app) do
      upload! 'config/application.yml', "#{shared_path}/config/application.yml"
    end
  end
end
