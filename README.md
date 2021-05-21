## Info
* Rails version : 6.1.3.2
* Ruby version : 3.0.1

## Ruby / Rails 셋팅
* Ruby 셋팅(rbenv) : https://kbs4674.tistory.com/187
* Rails 기본 셋팅 : https://kbs4674.tistory.com/190

## Cloud9 rvm 비활성화
1. https://gist.github.com/alexcalaca/f3b31718cdd1d24da70d8a13d62bb73f 과정을 따라 진행
2. 서버 리스타트
    ```
    sudo reboot
    ```

## .bashrc 설정 (예시)
```
cd junction
echo 'tt : Open Server'
echo 'sg : Azure SSH open'
echo 'apig : RAILS_ENV=production rake api_document:generate'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias tt="clear; ip; rails s -b 0.0.0.0 -p 3000"
alias sg="ssh -i '/home/ubuntu/environment/azure_key.pem' kbs4674@20.194.61.63"
alias apig='RAILS_ENV=production rake api_document:generate'
```