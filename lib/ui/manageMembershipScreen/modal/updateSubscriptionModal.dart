class UpdateSubscriptionModal {
  int? code;
  String? message;
  Hostedpage? hostedpage;

  UpdateSubscriptionModal({this.code, this.message, this.hostedpage});

  UpdateSubscriptionModal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    hostedpage = json['hostedpage'] != null
        ? Hostedpage.fromJson(json['hostedpage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (hostedpage != null) {
      data['hostedpage'] = hostedpage!.toJson();
    }
    return data;
  }
}

class Hostedpage {
  String? hostedpageId;
  String? decryptedHostedPageId;
  String? status;
  String? url;
  String? action;
  String? expiringTime;
  String? createdTime;

  Hostedpage(
      {this.hostedpageId,
      this.decryptedHostedPageId,
      this.status,
      this.url,
      this.action,
      this.expiringTime,
      this.createdTime});

  Hostedpage.fromJson(Map<String, dynamic> json) {
    hostedpageId = json['hostedpage_id'];
    decryptedHostedPageId = json['decrypted_hosted_page_id'];
    status = json['status'];
    url = json['url'];
    action = json['action'];
    expiringTime = json['expiring_time'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hostedpage_id'] = hostedpageId;
    data['decrypted_hosted_page_id'] = decryptedHostedPageId;
    data['status'] = status;
    data['url'] = url;
    data['action'] = action;
    data['expiring_time'] = expiringTime;
    data['created_time'] = createdTime;
    return data;
  }
}
