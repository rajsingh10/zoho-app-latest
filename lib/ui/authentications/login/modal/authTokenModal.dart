class AuthtokenModal {
  String? status;
  String? message;
  String? accessToken;

  AuthtokenModal({this.status, this.message, this.accessToken});

  AuthtokenModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['access_token'] = accessToken;
    return data;
  }
}
