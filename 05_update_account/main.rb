require 'easycodefrb'

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

# 요청 파라미터 설정
# - 계정관리 파라미터를 설정(https://developer.codef.io/cert/account/cid-overview)
account_list = [{
    'countryCode' => 'KR',
    'businessType' => 'BK',
    'clientType' => 'P',
    'organization' => '0004',
    'loginType' => '0',
    'password' => EasyCodef.encrypt_RSA('password', codef.public_key),
    'derFile' => EasyCodef.encode_to_file_str('DER_FILE_PATH'),
    'keyFile' => EasyCodef.encode_to_file_str('KEY_FILE_PATH')
}]

parameter = {
  'accountList' => account_list,
  'connectedId' => '8PQI4dQ......hKLhTnZ'
}

# 요청
result = codef.update_account(EasyCodef::TYPE_SANDBOX, parameter)
puts(result)