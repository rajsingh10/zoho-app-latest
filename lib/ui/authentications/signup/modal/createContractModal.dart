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
        ? LayoutDetails.fromJson(json['layoutDetails'])
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
        ? CustomerHappiness.fromJson(json['customerHappiness'])
        : null;
    webUrl = json['webUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['layoutId'] = layoutId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['accountCount'] = accountCount;
    data['email'] = email;
    data['secondaryEmail'] = secondaryEmail;
    data['mobile'] = mobile;
    data['phone'] = phone;
    data['city'] = city;
    data['country'] = country;
    data['state'] = state;
    data['street'] = street;
    data['zip'] = zip;
    data['description'] = description;
    data['title'] = title;
    data['type'] = type;
    data['createdTime'] = createdTime;
    data['modifiedTime'] = modifiedTime;
    data['ownerId'] = ownerId;
    data['accountId'] = accountId;
    if (layoutDetails != null) {
      data['layoutDetails'] = layoutDetails!.toJson();
    }
    data['isTrashed'] = isTrashed;
    data['isSpam'] = isSpam;
    data['isFollowing'] = isFollowing;
    data['zohoCRMContact'] = zohoCRMContact;
    data['isAnonymous'] = isAnonymous;
    data['isEndUser'] = isEndUser;
    data['isDeleted'] = isDeleted;
    data['photoURL'] = photoURL;
    if (customerHappiness != null) {
      data['customerHappiness'] = customerHappiness!.toJson();
    }
    data['webUrl'] = webUrl;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['layoutName'] = layoutName;
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
