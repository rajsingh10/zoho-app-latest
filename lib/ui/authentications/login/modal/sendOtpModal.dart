class SendOtpModal {
  bool? status;
  String? message;
  String? customerId;
  int? otp;

  SendOtpModal({this.status, this.message, this.customerId, this.otp});

  SendOtpModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    customerId = json['customer_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['customer_id'] = customerId;
    data['otp'] = otp;
    return data;
  }
}
