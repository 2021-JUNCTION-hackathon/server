2021 JUNCTION HACKATHON X Team Sharework

## DEV INFO
1. Ruby : 3.0.1
2. Ruby on Rails : 6.1.3.2

## Server Dev Tech
1. Ruby on Rails
2. [Swagger](https://swagger.io/) [[code1]](/server/blob/master/lib/tasks/api_document.rake) [[code2]](/server/blob/master/config/routes.rb) [[code3]](/server/blob/master/app/controllers/swagger_api_controller.rb)
4. [Capistrano (로컬 → Production 서버 배포툴)](https://github.com/capistrano/capistrano) [[code1]](/server/blob/master/config/deploy.rb) [[code2]](/server/blob/master/config/deploy/production.rb) [[code3]](/server/blob/master/config/server_init/init_system.sh)
5. [Rest API Server : Azure](https://azure.microsoft.com/)

## API Document
1. swagger : http://20.194.49.191/api
2. apipie : http://20.194.49.191/apipie

## Server API main code
1. Controller(API req/res) : [app/controllers/api/v1/mobilities_controller.rb](/server/blob/master/app/controllers/api/v1/mobilities_controller.rb)
2. Model(DB validation, association, ... define) : [app/models/mobility.rb](/server/blob/master/app/models/mobility.rb)
3. Serializer(JSON response) : [app/serializers/mobility_serializer.rb](/server/blob/master/app/serializers/mobility_serializer.rb)
