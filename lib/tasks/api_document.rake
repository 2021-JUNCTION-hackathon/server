namespace :api_document do
  task generate: :environment do
    time = Time.current.to_i
    
    # 테스트코드 실행 및 apipie API json 파일 생성(= 덮어쓰기)
    system("rails test") if Rails.env.production?
    
    # 이전에 있던 Swagger API json 파일 제거
    system("cd #{Rails.root}/doc/apidoc; rm schema_swagger_form_*.json")
    
    ## Swagger API json 파일 생성 Task 실행
    Rake::Task.clear
    Rails.application.load_tasks
    Rake::Task['apipie:static_swagger_json'].invoke
    
    ## 이전 Public 폴더에 있던 Swagger API json 파일 제거
    system("cd #{Rails.root}/public/apidocs/#{Rails.env}; rm schema_swagger_form_*.json")

    ## 최신 Swagger API json 파일 각 Public 폴더에 Copy 및 작업 후 제거
    system("cd #{Rails.root}/doc/apidoc;
      mv schema_swagger_form_data.json schema_swagger_form_data_#{time}.json;
      cp schema_swagger_form_data_#{time}.json ../../public/apidocs/#{Rails.env}/schema_swagger_form_data_#{time}.json;
      rm schema_swagger_form_*.json")
      
    ## config/routes.rb 내용 수정 (Swagger API 파일경로 변경)
    rd = IO.read "#{Rails.root}/app/controllers/swagger_api_controller.rb"
    tmp_lines = rd.split("\n")
    complete_word = []
    
    idx = 0
    rd.split("\n").each do |_line|
      if idx != tmp_lines.length
        if Rails.env.development? && tmp_lines[idx].match(/## development swagger API, Never change this line word/)
          idx += 3
          complete_word << '    ## development swagger API, Never change this line word'
          complete_word << '    if Rails.env.development?'
          complete_word << '      redirect_to "/swagger/dist/index.html?url=/apidocs/development/schema_swagger_form_data_' + "#{time}" + '.json"'
          complete_word << '    end'
        # elsif Rails.env.staging? && tmp_lines[idx].match(/## staaging swagger API, Never change this line word/)
        #   idx += 3
        #   complete_word << '  ## staging swagger API, Never change this line word'
        #   complete_word << '  if Rails.env.staging?'
        #   complete_word << '    get "/api" => redirect("/swagger/dist/index.html?url=/apidocs/staging/schema_swagger_form_data_' + "#{time}" + '.json")'
        #   complete_word << '  end'
        elsif Rails.env.production? && tmp_lines[idx].match(/## production swagger API, Never change this line word/)
          idx += 3
          complete_word << '    ## production swagger API, Never change this line word'
          complete_word << '    if Rails.env.production?'
          complete_word << '      redirect_to "/swagger/dist/index.html?url=/apidocs/production/schema_swagger_form_data.json"'
          complete_word << '    end'
        else
          complete_word << tmp_lines[idx]
        end
        
        idx += 1
      elsif Rails.env.development? && idx == tmp_lines.length
        complete_word << ''
        break
      elsif Rails.env.production? && idx == tmp_lines.length
        complete_word << ''
        break
      end
    end
    
    IO.write "#{Rails.root}/app/controllers/swagger_api_controller.rb", complete_word.join("\n")
  end
end
