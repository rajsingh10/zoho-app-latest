class GetTimeEntryModal {
  List<Data>? data;

  GetTimeEntryModal({this.data});

  GetTimeEntryModal.fromJson(Map<String, dynamic> json) {
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
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    executedTime = json['executedTime'];
    customFields = json['customFields'] != null
        ? CustomFields.fromJson(json['customFields'])
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
        ? LayoutDetails.fromJson(json['layoutDetails'])
        : null;
    secondsSpent = json['secondsSpent'];
    cf = json['cf'] != null ? Cf.fromJson(json['cf']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    data['executedTime'] = executedTime;
    if (customFields != null) {
      data['customFields'] = customFields!.toJson();
    }
    data['departmentId'] = departmentId;
    data['agentCostPerHour'] = agentCostPerHour;
    data['description'] = description;
    data['ownerId'] = ownerId;
    data['mode'] = mode;
    data['isTrashed'] = isTrashed;
    data['billingType'] = billingType;
    data['requestId'] = requestId;
    data['createdTime'] = createdTime;
    data['id'] = id;
    data['requestChargeType'] = requestChargeType;
    if (layoutDetails != null) {
      data['layoutDetails'] = layoutDetails!.toJson();
    }
    data['secondsSpent'] = secondsSpent;
    if (cf != null) {
      data['cf'] = cf!.toJson();
    }
    data['fixedCost'] = fixedCost;
    data['minutesSpent'] = minutesSpent;
    data['hoursSpent'] = hoursSpent;
    data['layoutId'] = layoutId;
    data['isBillable'] = isBillable;
    data['createdBy'] = createdBy;
    data['invoiceId'] = invoiceId;
    data['additionalCost'] = additionalCost;
    data['totalCost'] = totalCost;
    data['taskId'] = taskId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketNumber'] = ticketNumber;
    data['subject'] = subject;
    data['id'] = id;
    data['type'] = type;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
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

class Cf {
  String? cfDate;

  Cf({this.cfDate});

  Cf.fromJson(Map<String, dynamic> json) {
    cfDate = json['cf_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cf_date'] = cfDate;
    return data;
  }
}
