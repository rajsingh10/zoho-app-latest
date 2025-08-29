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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['customer_id'] = this.customerId;
    data['otp'] = this.otp;
    return data;
  }
}
