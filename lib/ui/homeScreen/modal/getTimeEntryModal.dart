class GetTimeEntryModal {
  List<Data>? data;

  GetTimeEntryModal({this.data});

  GetTimeEntryModal.fromJson(Map<String, dynamic> json) {
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
  Parent? parent;
  String? executedTime;
  CustomFields? customFields;
  String? departmentId;
  String? agentCostPerHour;
  String? description;
  String? ownerId;
  String? mode;
  bool? isTrashed;
  String? billingType;
  String? requestId;
  String? createdTime;
  String? id;
  String? requestChargeType;
  LayoutDetails? layoutDetails;
  String? secondsSpent;
  Cf? cf;
  String? fixedCost;
  String? minutesSpent;
  String? hoursSpent;
  String? layoutId;
  bool? isBillable;
  String? createdBy;
  String? invoiceId;
  String? additionalCost;
  String? totalCost;
  String? taskId;

  Data(
      {this.parent,
      this.executedTime,
      this.customFields,
      this.departmentId,
      this.agentCostPerHour,
      this.description,
      this.ownerId,
      this.mode,
      this.isTrashed,
      this.billingType,
      this.requestId,
      this.createdTime,
      this.id,
      this.requestChargeType,
      this.layoutDetails,
      this.secondsSpent,
      this.cf,
      this.fixedCost,
      this.minutesSpent,
      this.hoursSpent,
      this.layoutId,
      this.isBillable,
      this.createdBy,
      this.invoiceId,
      this.additionalCost,
      this.totalCost,
      this.taskId});

  Data.fromJson(Map<String, dynamic> json) {
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    executedTime = json['executedTime'];
    customFields = json['customFields'] != null
        ? new CustomFields.fromJson(json['customFields'])
        : null;
    departmentId = json['departmentId'];
    agentCostPerHour = json['agentCostPerHour'];
    description = json['description'];
    ownerId = json['ownerId'];
    mode = json['mode'];
    isTrashed = json['isTrashed'];
    billingType = json['billingType'];
    requestId = json['requestId'];
    createdTime = json['createdTime'];
    id = json['id'];
    requestChargeType = json['requestChargeType'];
    layoutDetails = json['layoutDetails'] != null
        ? new LayoutDetails.fromJson(json['layoutDetails'])
        : null;
    secondsSpent = json['secondsSpent'];
    cf = json['cf'] != null ? new Cf.fromJson(json['cf']) : null;
    fixedCost = json['fixedCost'];
    minutesSpent = json['minutesSpent'];
    hoursSpent = json['hoursSpent'];
    layoutId = json['layoutId'];
    isBillable = json['isBillable'];
    createdBy = json['createdBy'];
    invoiceId = json['invoiceId'];
    additionalCost = json['additionalCost'];
    totalCost = json['totalCost'];
    taskId = json['taskId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['executedTime'] = this.executedTime;
    if (this.customFields != null) {
      data['customFields'] = this.customFields!.toJson();
    }
    data['departmentId'] = this.departmentId;
    data['agentCostPerHour'] = this.agentCostPerHour;
    data['description'] = this.description;
    data['ownerId'] = this.ownerId;
    data['mode'] = this.mode;
    data['isTrashed'] = this.isTrashed;
    data['billingType'] = this.billingType;
    data['requestId'] = this.requestId;
    data['createdTime'] = this.createdTime;
    data['id'] = this.id;
    data['requestChargeType'] = this.requestChargeType;
    if (this.layoutDetails != null) {
      data['layoutDetails'] = this.layoutDetails!.toJson();
    }
    data['secondsSpent'] = this.secondsSpent;
    if (this.cf != null) {
      data['cf'] = this.cf!.toJson();
    }
    data['fixedCost'] = this.fixedCost;
    data['minutesSpent'] = this.minutesSpent;
    data['hoursSpent'] = this.hoursSpent;
    data['layoutId'] = this.layoutId;
    data['isBillable'] = this.isBillable;
    data['createdBy'] = this.createdBy;
    data['invoiceId'] = this.invoiceId;
    data['additionalCost'] = this.additionalCost;
    data['totalCost'] = this.totalCost;
    data['taskId'] = this.taskId;
    return data;
  }
}

class Parent {
  String? ticketNumber;
  String? subject;
  String? id;
  String? type;

  Parent({this.ticketNumber, this.subject, this.id, this.type});

  Parent.fromJson(Map<String, dynamic> json) {
    ticketNumber = json['ticketNumber'];
    subject = json['subject'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticketNumber'] = this.ticketNumber;
    data['subject'] = this.subject;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class CustomFields {
  String? date;

  CustomFields({this.date});

  CustomFields.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
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

class Cf {
  String? cfDate;

  Cf({this.cfDate});

  Cf.fromJson(Map<String, dynamic> json) {
    cfDate = json['cf_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cf_date'] = this.cfDate;
    return data;
  }
}
