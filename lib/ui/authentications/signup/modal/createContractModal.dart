class CreateContractModal {
  String? id;
  String? layoutId;
  String? firstName;
  String? lastName;
  String? facebook;
  String? twitter;
  String? accountCount;
  String? email;
  String? secondaryEmail;
  String? mobile;
  String? phone;
  String? city;
  String? country;
  String? state;
  String? street;
  String? zip;
  String? description;
  String? title;
  String? type;
  String? createdTime;
  String? modifiedTime;
  String? ownerId;
  String? accountId;
  LayoutDetails? layoutDetails;
  bool? isTrashed;
  bool? isSpam;
  bool? isFollowing;
  String? zohoCRMContact;
  bool? isAnonymous;
  bool? isEndUser;
  bool? isDeleted;
  String? photoURL;
  CustomerHappiness? customerHappiness;
  String? webUrl;

  CreateContractModal(
      {this.id,
      this.layoutId,
      this.firstName,
      this.lastName,
      this.facebook,
      this.twitter,
      this.accountCount,
      this.email,
      this.secondaryEmail,
      this.mobile,
      this.phone,
      this.city,
      this.country,
      this.state,
      this.street,
      this.zip,
      this.description,
      this.title,
      this.type,
      this.createdTime,
      this.modifiedTime,
      this.ownerId,
      this.accountId,
      this.layoutDetails,
      this.isTrashed,
      this.isSpam,
      this.isFollowing,
      this.zohoCRMContact,
      this.isAnonymous,
      this.isEndUser,
      this.isDeleted,
      this.photoURL,
      this.customerHappiness,
      this.webUrl});

  CreateContractModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layoutId = json['layoutId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    accountCount = json['accountCount'];
    email = json['email'];
    secondaryEmail = json['secondaryEmail'];
    mobile = json['mobile'];
    phone = json['phone'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    street = json['street'];
    zip = json['zip'];
    description = json['description'];
    title = json['title'];
    type = json['type'];
    createdTime = json['createdTime'];
    modifiedTime = json['modifiedTime'];
    ownerId = json['ownerId'];
    accountId = json['accountId'];
    layoutDetails = json['layoutDetails'] != null
        ? new LayoutDetails.fromJson(json['layoutDetails'])
        : null;
    isTrashed = json['isTrashed'];
    isSpam = json['isSpam'];
    isFollowing = json['isFollowing'];
    zohoCRMContact = json['zohoCRMContact'];
    isAnonymous = json['isAnonymous'];
    isEndUser = json['isEndUser'];
    isDeleted = json['isDeleted'];
    photoURL = json['photoURL'];
    customerHappiness = json['customerHappiness'] != null
        ? new CustomerHappiness.fromJson(json['customerHappiness'])
        : null;
    webUrl = json['webUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['layoutId'] = this.layoutId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['accountCount'] = this.accountCount;
    data['email'] = this.email;
    data['secondaryEmail'] = this.secondaryEmail;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['street'] = this.street;
    data['zip'] = this.zip;
    data['description'] = this.description;
    data['title'] = this.title;
    data['type'] = this.type;
    data['createdTime'] = this.createdTime;
    data['modifiedTime'] = this.modifiedTime;
    data['ownerId'] = this.ownerId;
    data['accountId'] = this.accountId;
    if (this.layoutDetails != null) {
      data['layoutDetails'] = this.layoutDetails!.toJson();
    }
    data['isTrashed'] = this.isTrashed;
    data['isSpam'] = this.isSpam;
    data['isFollowing'] = this.isFollowing;
    data['zohoCRMContact'] = this.zohoCRMContact;
    data['isAnonymous'] = this.isAnonymous;
    data['isEndUser'] = this.isEndUser;
    data['isDeleted'] = this.isDeleted;
    data['photoURL'] = this.photoURL;
    if (this.customerHappiness != null) {
      data['customerHappiness'] = this.customerHappiness!.toJson();
    }
    data['webUrl'] = this.webUrl;
    return data;
  }
}

class LayoutDetails {
  String? id;
  String? layoutName;

  LayoutDetails({this.id, this.layoutName});

  LayoutDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layoutName = json['layoutName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['layoutName'] = this.layoutName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['badPercentage'] = this.badPercentage;
    data['okPercentage'] = this.okPercentage;
    data['goodPercentage'] = this.goodPercentage;
    return data;
  }
}
