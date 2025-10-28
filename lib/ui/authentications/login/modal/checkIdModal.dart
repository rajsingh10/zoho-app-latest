class CheckIdModal {
  List<Data>? data;
  var count;

  CheckIdModal({this.data, this.count});

  CheckIdModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Data {
  String? id;

  Data({
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;

    return data;
  }
}

class CustomerHappiness {
  String? badPercentage;
  String? okPercentage;
  String? goodPercentage;

  CustomerHappiness(
      {this.badPercentage, this.okPercentage, this.goodPercentage});

  CustomerHappiness.fromJson(Map<String, dynamic> json) {
    badPercentage = json['badPercentage'];
    okPercentage = json['okPercentage'];
    goodPercentage = json['goodPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['badPercentage'] = badPercentage;
    data['okPercentage'] = okPercentage;
    data['goodPercentage'] = goodPercentage;
    return data;
  }
}

class Owner {
  String? photoURL;
  String? firstName;
  String? lastName;
  String? emailId;
  String? id;
  String? zuid;

  Owner(
      {this.photoURL,
      this.firstName,
      this.lastName,
      this.emailId,
      this.id,
      this.zuid});

  Owner.fromJson(Map<String, dynamic> json) {
    photoURL = json['photoURL'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    id = json['id'];
    zuid = json['zuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photoURL'] = photoURL;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailId'] = emailId;
    data['id'] = id;
    data['zuid'] = zuid;
    return data;
  }
}
