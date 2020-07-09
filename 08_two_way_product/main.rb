require 'easycodefrb'
require 'json'

# 2Way 필수 데이터 셋팅
def setup_two_way_info(parameter, result)
  result_data = JSON.parse(result)
  data = result_data['data']
  two_way_info = {
    'jobIndex' => data['jobIndex'],
    'threadIndex' => data['threadIndex'],
    'jti' => data['jti'],
    'twoWayTimestamp' => data['twoWayTimestamp']
  }

  parameter['twoWayInfo'] = two_way_info
  parameter['is2Way'] = true
end

demo_client_id = ''
demo_client_secret = ''

client_id = ''
client_secret = ''

public_key = ''

# 코드에프 인스턴스 생성
codef = EasyCodef::Codef.new(public_key)

# 데모 클라이언트 정보 설정
# - 데모 서비스 가입 후 코드에프 홈페이지에 확인 가능(https://codef.io/#/account/keys)
# - 데모 서비스로 상품 조회 요청시 필수 입력 항목
codef.set_client_info_for_demo(demo_client_id, demo_client_secret)

# 정식 클라이언트 정보 설정
# - 정식 서비스 가입 후 코드에프 홈페이지에 확인 가능(https://codef.io/#/account/keys)
# - 정식 서비스로 상품 조회 요청시 필수 입력 항
codef.set_client_info(client_id, client_secret)

parameter = {
  'organization' => '0001',
  'userName' => '이름',
  'identity' => '199101011',
  'phoneNo' => '01000000000',
  'telecom' => '0',
  'timeout' => '120',
  'authMethod' => '0',
  'applicationType' => '0',
  'phoneNo1' => ''
}

# 공정거래위원회 수신거부 등록/해제 신청 테스트 (https://developer.codef.io/products/public/each/ft/set-register)
product_url = '/v1/kr/public/ft/do-not-call/set-register' 
service_type = EasyCodef::TYPE_PRODUCT

# 상품 요청
result = codef.request_product(product_url, service_type, parameter)
puts(result)

# 보안 숫자 인증
puts('보안숫자 입력 : ')
secure_no = gets().gsub(/\n/, '')

parameter['secureNo'] = secure_no
parameter['secureNoRefresh'] = '0'
setup_two_way_info(parameter, result)

result = codef.request_certification(product_url, service_type, parameter)
puts(result)

# SMS 인증
puts('SMS인증숫자 입력 : ')
sms_auth_no = gets().gsub(/\n/, '')
parameter['smsAuthNo'] = sms_auth_no
setup_two_way_info(parameter, result)
result = codef.request_certification(product_url, service_type, parameter)
puts(result)
