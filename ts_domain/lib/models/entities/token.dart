class Token {
  final String accessToken;

  Token({required this.accessToken});

  factory Token.mock() {
    return Token(accessToken: "mock_access_token");
  }
}
