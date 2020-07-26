require 'easycodefrb'

demo_client_id = ''
demo_client_secret = ''

client_id     = ''
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

# 요청 파라미터 설정
# - 각 상품별 파라미터를 설정(https://developer.codef.io/products))
parameter = {
  'connectedId' => '8PQI4dQ......hKLhTnZ',
  'organization' => '0004',
}

# 은행 보유계좌 조회 요청 테스트 (https://developer.codef.io/products/bank/common/p/account)
product_url = '/v1/kr/bank/p/account/account-list'
result = codef.request_product(product_url, EasyCodef::TYPE_SANDBOX, parameter)
puts(result)
