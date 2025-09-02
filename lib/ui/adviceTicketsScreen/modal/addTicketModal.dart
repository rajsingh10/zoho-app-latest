class AddTicketModal {
  String? modifiedTime;
  String? subCategory;
  String? statusType;
  String? subject;
  String? dueDate;
  String? departmentId;
  String? channel;
  String? onholdTime;
  String? language;
  Source? source;
  String? resolution;
  String? closedTime;
  String? approvalCount;
  bool? isOverDue;
  bool? isTrashed;
  String? createdTime;
  String? id;
  bool? isResponseOverdue;
  String? customerResponseTime;
  String? productId;
  String? contactId;
  String? threadCount;
  String? priority;
  String? classification;
  String? commentCount;
  String? taskCount;
  String? accountId;
  String? phone;
  String? webUrl;
  bool? isSpam;
  String? status;
  String? ticketNumber;

  bool? isArchived;
  String? description;
  String? timeEntryCount;
  String? channelRelatedInfo;
  String? responseDueDate;
  bool? isDeleted;
  String? modifiedBy;
  String? email;
  LayoutDetails? layoutDetails;
  String? channelCode;
  String? slaId;
  String? layoutId;
  String? assigneeId;
  String? teamId;
  String? attachmentCount;
  bool? isEscalated;
  String? category;

  AddTicketModal(
      {this.modifiedTime,
      this.subCategory,
      this.statusType,
      this.subject,
      this.dueDate,
      this.departmentId,
      this.channel,
      this.onholdTime,
      this.language,
      this.source,
      this.resolution,
      this.closedTime,
      this.approvalCount,
      this.isOverDue,
      this.isTrashed,
      this.createdTime,
      this.id,
      this.isResponseOverdue,
      this.customerResponseTime,
      this.productId,
      this.contactId,
      this.threadCount,
      this.priority,
      this.classification,
      this.commentCount,
      this.taskCount,
      this.accountId,
      this.phone,
      this.webUrl,
      this.isSpam,
      this.status,
      this.ticketNumber,
      this.isArchived,
      this.description,
      this.timeEntryCount,
      this.channelRelatedInfo,
      this.responseDueDate,
      this.isDeleted,
      this.modifiedBy,
      this.email,
      this.layoutDetails,
      this.channelCode,
      this.slaId,
      this.layoutId,
      this.assigneeId,
      this.teamId,
      this.attachmentCount,
      this.isEscalated,
      this.category});

  AddTicketModal.fromJson(Map<String, dynamic> json) {
    modifiedTime = json['modifiedTime'];
    subCategory = json['subCategory'];
    statusType = json['statusType'];
    subject = json['subject'];
    dueDate = json['dueDate'];
    departmentId = json['departmentId'];
    channel = json['channel'];
    onholdTime = json['onholdTime'];
    language = json['language'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    resolution = json['resolution'];
    closedTime = json['closedTime'];
    approvalCount = json['approvalCount'];
    isOverDue = json['isOverDue'];
    isTrashed = json['isTrashed'];
    createdTime = json['createdTime'];
    id = json['id'];
    isResponseOverdue = json['isResponseOverdue'];
    customerResponseTime = json['customerResponseTime'];
    productId = json['productId'];
    contactId = json['contactId'];
    threadCount = json['threadCount'];
    priority = json['priority'];
    classification = json['classification'];
    commentCount = json['commentCount'];
    taskCount = json['taskCount'];
    accountId = json['accountId'];
    phone = json['phone'];
    webUrl = json['webUrl'];
    isSpam = json['isSpam'];
    status = json['status'];
    ticketNumber = json['ticketNumber'];
    // customFields = json['customFields'] != null ? new CustomFields.fromJson(json['customFields']) : null;
    isArchived = json['isArchived'];
    description = json['description'];
    timeEntryCount = json['timeEntryCount'];
    channelRelatedInfo = json['channelRelatedInfo'];
    responseDueDate = json['responseDueDate'];
    isDeleted = json['isDeleted'];
    modifiedBy = json['modifiedBy'];
    email = json['email'];
    layoutDetails = json['layoutDetails'] != null
        ? LayoutDetails.fromJson(json['layoutDetails'])
        : null;
    channelCode = json['channelCode'];
    slaId = json['slaId'];
    layoutId = json['layoutId'];
    assigneeId = json['assigneeId'];
    teamId = json['teamId'];
    attachmentCount = json['attachmentCount'];
    isEscalated = json['isEscalated'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modifiedTime'] = modifiedTime;
    data['subCategory'] = subCategory;
    data['statusType'] = statusType;
    data['subject'] = subject;
    data['dueDate'] = dueDate;
    data['departmentId'] = departmentId;
    data['channel'] = channel;
    data['onholdTime'] = onholdTime;
    data['language'] = language;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['resolution'] = resolution;
    data['closedTime'] = closedTime;
    data['approvalCount'] = approvalCount;
    data['isOverDue'] = isOverDue;
    data['isTrashed'] = isTrashed;
    data['createdTime'] = createdTime;
    data['id'] = id;
    data['isResponseOverdue'] = isResponseOverdue;
    data['customerResponseTime'] = customerResponseTime;
    data['productId'] = productId;
    data['contactId'] = contactId;
    data['threadCount'] = threadCount;
    data['priority'] = priority;
    data['classification'] = classification;
    data['commentCount'] = commentCount;
    data['taskCount'] = taskCount;
    data['accountId'] = accountId;
    data['phone'] = phone;
    data['webUrl'] = webUrl;
    data['isSpam'] = isSpam;
    data['status'] = status;
    data['ticketNumber'] = ticketNumber;
    // if (this.customFields != null) {
    //   data['customFields'] = this.customFields!.toJson();
    // }
    data['isArchived'] = isArchived;
    data['description'] = description;
    data['timeEntryCount'] = timeEntryCount;
    data['channelRelatedInfo'] = channelRelatedInfo;
    data['responseDueDate'] = responseDueDate;
    data['isDeleted'] = isDeleted;
    data['modifiedBy'] = modifiedBy;
    data['email'] = email;
    if (layoutDetails != null) {
      data['layoutDetails'] = layoutDetails!.toJson();
    }
    data['channelCode'] = channelCode;
    data['slaId'] = slaId;
    data['layoutId'] = layoutId;
    data['assigneeId'] = assigneeId;
    data['teamId'] = teamId;
    data['attachmentCount'] = attachmentCount;
    data['isEscalated'] = isEscalated;
    data['category'] = category;
    return data;
  }
}

class Source {
  String? appName;
  String? extId;
  String? permalink;
  String? type;
  String? appPhotoURL;

  Source(
      {this.appName, this.extId, this.permalink, this.type, this.appPhotoURL});

  Source.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    extId = json['extId'];
    permalink = json['permalink'];
    type = json['type'];
    appPhotoURL = json['appPhotoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appName'] = appName;
    data['extId'] = extId;
    data['permalink'] = permalink;
    data['type'] = type;
    data['appPhotoURL'] = appPhotoURL;
    return data;
  }
}

// class CustomFields {
//
//
//   CustomFields({});
//
// CustomFields.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }

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
