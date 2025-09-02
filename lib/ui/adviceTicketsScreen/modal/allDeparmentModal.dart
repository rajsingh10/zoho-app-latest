class AllDeparmentModal {
  List<Data>? data;

  AllDeparmentModal({this.data});

  AllDeparmentModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  String? createdTime;
  String? creatorId;
  String? nameInCustomerPortal;
  String? chatStatus;
  String? sanitizedName;
  bool? isVisibleInCustomerPortal;
  bool? isAssignToTeamEnabled;
  bool? hasLogo;
  bool? isEnabled;
  bool? isDefault;

  Data(
      {this.id,
      this.name,
      this.description,
      this.createdTime,
      this.creatorId,
      this.nameInCustomerPortal,
      this.chatStatus,
      this.sanitizedName,
      this.isVisibleInCustomerPortal,
      this.isAssignToTeamEnabled,
      this.hasLogo,
      this.isEnabled,
      this.isDefault});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdTime = json['createdTime'];
    creatorId = json['creatorId'];
    nameInCustomerPortal = json['nameInCustomerPortal'];
    chatStatus = json['chatStatus'];
    sanitizedName = json['sanitizedName'];
    isVisibleInCustomerPortal = json['isVisibleInCustomerPortal'];
    isAssignToTeamEnabled = json['isAssignToTeamEnabled'];
    hasLogo = json['hasLogo'];
    isEnabled = json['isEnabled'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['createdTime'] = createdTime;
    data['creatorId'] = creatorId;
    data['nameInCustomerPortal'] = nameInCustomerPortal;
    data['chatStatus'] = chatStatus;
    data['sanitizedName'] = sanitizedName;
    data['isVisibleInCustomerPortal'] = isVisibleInCustomerPortal;
    data['isAssignToTeamEnabled'] = isAssignToTeamEnabled;
    data['hasLogo'] = hasLogo;
    data['isEnabled'] = isEnabled;
    data['isDefault'] = isDefault;
    return data;
  }
}
