class RequestTokenModel {
  bool success;
  String expiresAt;
  String requestToken;

  RequestTokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  // Factory method to create an instance from JSON
  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      success: json['success'],
      expiresAt: json['expires_at'],
      requestToken: json['request_token'],
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'expires_at': expiresAt,
      'request_token': requestToken,
    };
  }
}
