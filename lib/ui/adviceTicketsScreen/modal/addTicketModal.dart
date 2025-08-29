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
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
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
        ? new LayoutDetails.fromJson(json['layoutDetails'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modifiedTime'] = this.modifiedTime;
    data['subCategory'] = this.subCategory;
    data['statusType'] = this.statusType;
    data['subject'] = this.subject;
    data['dueDate'] = this.dueDate;
    data['departmentId'] = this.departmentId;
    data['channel'] = this.channel;
    data['onholdTime'] = this.onholdTime;
    data['language'] = this.language;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['resolution'] = this.resolution;
    data['closedTime'] = this.closedTime;
    data['approvalCount'] = this.approvalCount;
    data['isOverDue'] = this.isOverDue;
    data['isTrashed'] = this.isTrashed;
    data['createdTime'] = this.createdTime;
    data['id'] = this.id;
    data['isResponseOverdue'] = this.isResponseOverdue;
    data['customerResponseTime'] = this.customerResponseTime;
    data['productId'] = this.productId;
    data['contactId'] = this.contactId;
    data['threadCount'] = this.threadCount;
    data['priority'] = this.priority;
    data['classification'] = this.classification;
    data['commentCount'] = this.commentCount;
    data['taskCount'] = this.taskCount;
    data['accountId'] = this.accountId;
    data['phone'] = this.phone;
    data['webUrl'] = this.webUrl;
    data['isSpam'] = this.isSpam;
    data['status'] = this.status;
    data['ticketNumber'] = this.ticketNumber;
    // if (this.customFields != null) {
    //   data['customFields'] = this.customFields!.toJson();
    // }
    data['isArchived'] = this.isArchived;
    data['description'] = this.description;
    data['timeEntryCount'] = this.timeEntryCount;
    data['channelRelatedInfo'] = this.channelRelatedInfo;
    data['responseDueDate'] = this.responseDueDate;
    data['isDeleted'] = this.isDeleted;
    data['modifiedBy'] = this.modifiedBy;
    data['email'] = this.email;
    if (this.layoutDetails != null) {
      data['layoutDetails'] = this.layoutDetails!.toJson();
    }
    data['channelCode'] = this.channelCode;
    data['slaId'] = this.slaId;
    data['layoutId'] = this.layoutId;
    data['assigneeId'] = this.assigneeId;
    data['teamId'] = this.teamId;
    data['attachmentCount'] = this.attachmentCount;
    data['isEscalated'] = this.isEscalated;
    data['category'] = this.category;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['extId'] = this.extId;
    data['permalink'] = this.permalink;
    data['type'] = this.type;
    data['appPhotoURL'] = this.appPhotoURL;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['layoutName'] = this.layoutName;
    return data;
  }
}
