class MarketingOptModal {
  bool? success;
  String? message;
  Data? data;

  MarketingOptModal({this.success, this.message, this.data});

  MarketingOptModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? customerId;
  var marketingOptIn;

  Data({this.customerId, this.marketingOptIn});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    marketingOptIn = json['marketing_opt_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['marketing_opt_in'] = marketingOptIn;
    return data;
  }
}
