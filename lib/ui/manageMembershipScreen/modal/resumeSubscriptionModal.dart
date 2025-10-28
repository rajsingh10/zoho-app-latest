class ResumeMembershipModal {
  var code;
  String? message;

  ResumeMembershipModal({this.code, this.message});

  ResumeMembershipModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
