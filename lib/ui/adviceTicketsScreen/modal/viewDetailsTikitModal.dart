class ViewDetailsTikitModal {
  String? modifiedTime;
  var subCategory;
  String? statusType;
  String? subject;
  String? dueDate;
  String? departmentId;
  String? channel;
  Source? source;
  var resolution;
  var closedTime;
  String? approvalCount;
  bool? isOverDue;
  bool? isTrashed;
  String? createdTime;
  String? id;
  bool? isResponseOverdue;
  String? customerResponseTime;
  var productId;
  String? contactId;
  String? threadCount;
  String? priority;
  var classification;
  String? commentCount;
  String? taskCount;
  var accountId;
  var phone;
  String? webUrl;
  bool? isSpam;
  String? status;
  String? ticketNumber;
  var sentiment;
  bool? isArchived;
  String? description;
  String? timeEntryCount;
  var channelRelatedInfo;
  var responseDueDate;
  bool? isDeleted;
  String? modifiedBy;
  String? followerCount;
  var email;
  LayoutDetails? layoutDetails;
  var channelCode;
  bool? isFollowing;
  String? slaId;
  String? layoutId;
  var assigneeId;
  String? createdBy;
  String? teamId;
  String? tagCount;
  String? attachmentCount;
  bool? isEscalated;
  var category;

  ViewDetailsTikitModal(
      {this.modifiedTime,
      this.subCategory,
      this.statusType,
      this.subject,
      this.dueDate,
      this.departmentId,
      this.channel,
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
      this.sentiment,
      this.isArchived,
      this.description,
      this.timeEntryCount,
      this.channelRelatedInfo,
      this.responseDueDate,
      this.isDeleted,
      this.modifiedBy,
      this.followerCount,
      this.email,
      this.layoutDetails,
      this.channelCode,
      this.isFollowing,
      this.slaId,
      this.layoutId,
      this.assigneeId,
      this.createdBy,
      this.teamId,
      this.tagCount,
      this.attachmentCount,
      this.isEscalated,
      this.category});

  ViewDetailsTikitModal.fromJson(Map<String, dynamic> json) {
    modifiedTime = json['modifiedTime'];
    subCategory = json['subCategory'];
    statusType = json['statusType'];
    subject = json['subject'];
    dueDate = json['dueDate'];
    departmentId = json['departmentId'];
    channel = json['channel'];
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
    sentiment = json['sentiment'];
    isArchived = json['isArchived'];
    description = json['description'];
    timeEntryCount = json['timeEntryCount'];
    channelRelatedInfo = json['channelRelatedInfo'];
    responseDueDate = json['responseDueDate'];
    isDeleted = json['isDeleted'];
    modifiedBy = json['modifiedBy'];
    followerCount = json['followerCount'];
    email = json['email'];
    layoutDetails = json['layoutDetails'] != null
        ? LayoutDetails.fromJson(json['layoutDetails'])
        : null;
    channelCode = json['channelCode'];
    isFollowing = json['isFollowing'];
    slaId = json['slaId'];
    layoutId = json['layoutId'];
    assigneeId = json['assigneeId'];
    createdBy = json['createdBy'];
    teamId = json['teamId'];
    tagCount = json['tagCount'];
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
    data['sentiment'] = sentiment;
    data['isArchived'] = isArchived;
    data['description'] = description;
    data['timeEntryCount'] = timeEntryCount;
    data['channelRelatedInfo'] = channelRelatedInfo;
    data['responseDueDate'] = responseDueDate;
    data['isDeleted'] = isDeleted;
    data['modifiedBy'] = modifiedBy;
    data['followerCount'] = followerCount;
    data['email'] = email;
    if (layoutDetails != null) {
      data['layoutDetails'] = layoutDetails!.toJson();
    }
    data['channelCode'] = channelCode;
    data['isFollowing'] = isFollowing;
    data['slaId'] = slaId;
    data['layoutId'] = layoutId;
    data['assigneeId'] = assigneeId;
    data['createdBy'] = createdBy;
    data['teamId'] = teamId;
    data['tagCount'] = tagCount;
    data['attachmentCount'] = attachmentCount;
    data['isEscalated'] = isEscalated;
    data['category'] = category;
    return data;
  }
}

class Source {
  var appName;
  var extId;
  var permalink;
  String? type;
  var uuid;
  var appPhotoURL;

  Source(
      {this.appName,
      this.extId,
      this.permalink,
      this.type,
      this.uuid,
      this.appPhotoURL});

  Source.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    extId = json['extId'];
    permalink = json['permalink'];
    type = json['type'];
    uuid = json['uuid'];
    appPhotoURL = json['appPhotoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appName'] = appName;
    data['extId'] = extId;
    data['permalink'] = permalink;
    data['type'] = type;
    data['uuid'] = uuid;
    data['appPhotoURL'] = appPhotoURL;
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
