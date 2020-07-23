# easycodefrb-exam

### About
[esaycodefrb](https://github.com/codef-io/easycodefrb) 라이브러리 사용 예제입니다.  

### Quick Start
```bash
$ git clone https://github.com/codef-io/easycodefrb-exam.git

# bundler
$ bundle install

# or gem
$ gem install
```

### Use it

각 예제를 사용할 때 인증 정보와 암호화 키 정보를 셋팅해서 사용합니다.

```ruby
demo_client_id = ''
demo_client_secret = ''

client_id = ''
client_secret = ''

public_key = ''
```

예제들은 기본적으로 샌드박스 타입으로 요청되며 데모 또는 정식 버전 테스트를 원하실 경우 요청 타입을 변경해서 사용합니다.

```ruby
...

result = codef.request_token(EasyCodef::TYPE_SANDBOX)

...
```
