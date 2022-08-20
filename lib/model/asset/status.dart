/// Auth와 관련된 모든 상태를 [enum] 형식으로 나열한다.
enum Status {
  /// related w/ SignUp
  /// 기존에 이미 이메일 정보가 있는 상태이다.
  emailAlreadyExist,

  /// related w/ SignUp, SignIn
  /// 이메일 형식이 맞지 않는 상태이다.
  invalidEmail,

  /// related w/ SignIn
  /// 사용자 정보가 없는(확인되지 않는) 상태이다.
  userNotFound,

  /// related w/ SignIn
  /// 잘못된 비밀번호를 입력한 상태이다.
  wrongPassword,

  /// related w/ SignUp
  /// 인증 이메일 발송시, 이미 인증된 상태이다.
  alreadyVerified,

  /// related w/ SignIn, SignUp
  /// 위 error 이외의 상태이다.
  error,

  /// related w/ SignIn, SignUp
  /// Auth작업이 성공한 상태이다.
  success,

  /// 로그인 상태
  /// 이메일 인증까지 완료된 상태이다.
  signIn,

  /// 이메일 인증이 되지 않은 상태이다.
  notEmailVerified,

  /// 로그아웃된 상태
  signOut
}
