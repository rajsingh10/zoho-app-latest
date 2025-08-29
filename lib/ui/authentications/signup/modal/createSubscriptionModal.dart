class CreateSubscriptionModal {
  int? code;
  String? message;
  Hostedpage? hostedpage;

  CreateSubscriptionModal({this.code, this.message, this.hostedpage});

  CreateSubscriptionModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    hostedpage = json['hostedpage'] != null
        ? new Hostedpage.fromJson(json['hostedpage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.hostedpage != null) {
      data['hostedpage'] = this.hostedpage!.toJson();
    }
    return data;
  }
}

class Hostedpage {
  String? hostedpageId;
  String? status;
  String? url;
  String? action;
  String? expiringTime;
  String? createdTime;

  Hostedpage(
      {this.hostedpageId,
      this.status,
      this.url,
      this.action,
      this.expiringTime,
      this.createdTime});

  Hostedpage.fromJson(Map<String, dynamic> json) {
    hostedpageId = json['hostedpage_id'];
    status = json['status'];
    url = json['url'];
    action = json['action'];
    expiringTime = json['expiring_time'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hostedpage_id'] = this.hostedpageId;
    data['status'] = this.status;
    data['url'] = this.url;
    data['action'] = this.action;
    data['expiring_time'] = this.expiringTime;
    data['created_time'] = this.createdTime;
    return data;
  }
}
