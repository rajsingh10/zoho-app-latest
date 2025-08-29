class AllDeparmentModal {
  List<Data>? data;

  AllDeparmentModal({this.data});

  AllDeparmentModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['createdTime'] = this.createdTime;
    data['creatorId'] = this.creatorId;
    data['nameInCustomerPortal'] = this.nameInCustomerPortal;
    data['chatStatus'] = this.chatStatus;
    data['sanitizedName'] = this.sanitizedName;
    data['isVisibleInCustomerPortal'] = this.isVisibleInCustomerPortal;
    data['isAssignToTeamEnabled'] = this.isAssignToTeamEnabled;
    data['hasLogo'] = this.hasLogo;
    data['isEnabled'] = this.isEnabled;
    data['isDefault'] = this.isDefault;
    return data;
  }
}
