class MyTickitModal {
  List<Data>? data;

  MyTickitModal({this.data});

  MyTickitModal.fromJson(Map<String, dynamic> json) {
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
  String? ticketNumber;
  String? layoutId;
  String? email;
  String? phone;
  String? subject;
  String? status;
  String? statusType;
  String? createdTime;
  String? category;
  String? language;
  String? subCategory;
  String? priority;
  String? channel;
  String? dueDate;
  String? responseDueDate;
  String? commentCount;
  String? sentiment;
  String? threadCount;
  String? closedTime;
  String? onholdTime;
  String? accountId;
  String? departmentId;
  String? contactId;
  String? productId;
  String? assigneeId;
  String? teamId;
  String? relationshipType;
  String? channelCode;
  bool? isSpam;
  Source? source;
  var lastThread;
  String? customerResponseTime;
  bool? isArchived;
  String? webUrl;

  Data(
      {this.id,
      this.ticketNumber,
      this.layoutId,
      this.email,
      this.phone,
      this.subject,
      this.status,
      this.statusType,
      this.createdTime,
      this.category,
      this.language,
      this.subCategory,
      this.priority,
      this.channel,
      this.dueDate,
      this.responseDueDate,
      this.commentCount,
      this.sentiment,
      this.threadCount,
      this.closedTime,
      this.onholdTime,
      this.accountId,
      this.departmentId,
      this.contactId,
      this.productId,
      this.assigneeId,
      this.teamId,
      this.relationshipType,
      this.channelCode,
      this.isSpam,
      this.source,
      this.lastThread,
      this.customerResponseTime,
      this.isArchived,
      this.webUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketNumber = json['ticketNumber'];
    layoutId = json['layoutId'];
    email = json['email'];
    phone = json['phone'];
    subject = json['subject'];
    status = json['status'];
    statusType = json['statusType'];
    createdTime = json['createdTime'];
    category = json['category'];
    language = json['language'];
    subCategory = json['subCategory'];
    priority = json['priority'];
    channel = json['channel'];
    dueDate = json['dueDate'];
    responseDueDate = json['responseDueDate'];
    commentCount = json['commentCount'];
    sentiment = json['sentiment'];
    threadCount = json['threadCount'];
    closedTime = json['closedTime'];
    onholdTime = json['onholdTime'];
    accountId = json['accountId'];
    departmentId = json['departmentId'];
    contactId = json['contactId'];
    productId = json['productId'];
    assigneeId = json['assigneeId'];
    teamId = json['teamId'];
    relationshipType = json['relationshipType'];
    channelCode = json['channelCode'];
    isSpam = json['isSpam'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    lastThread = json['lastThread'];
    customerResponseTime = json['customerResponseTime'];
    isArchived = json['isArchived'];
    webUrl = json['webUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ticketNumber'] = ticketNumber;
    data['layoutId'] = layoutId;
    data['email'] = email;
    data['phone'] = phone;
    data['subject'] = subject;
    data['status'] = status;
    data['statusType'] = statusType;
    data['createdTime'] = createdTime;
    data['category'] = category;
    data['language'] = language;
    data['subCategory'] = subCategory;
    data['priority'] = priority;
    data['channel'] = channel;
    data['dueDate'] = dueDate;
    data['responseDueDate'] = responseDueDate;
    data['commentCount'] = commentCount;
    data['sentiment'] = sentiment;
    data['threadCount'] = threadCount;
    data['closedTime'] = closedTime;
    data['onholdTime'] = onholdTime;
    data['accountId'] = accountId;
    data['departmentId'] = departmentId;
    data['contactId'] = contactId;
    data['productId'] = productId;
    data['assigneeId'] = assigneeId;
    data['teamId'] = teamId;
    data['relationshipType'] = relationshipType;
    data['channelCode'] = channelCode;
    data['isSpam'] = isSpam;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['lastThread'] = lastThread;
    data['customerResponseTime'] = customerResponseTime;
    data['isArchived'] = isArchived;
    data['webUrl'] = webUrl;
    return data;
  }
}

class Source {
  String? extId;
  String? appName;
  String? appPhotoURL;
  String? permalink;
  String? type;

  Source(
      {this.extId, this.appName, this.appPhotoURL, this.permalink, this.type});

  Source.fromJson(Map<String, dynamic> json) {
    extId = json['extId'];
    appName = json['appName'];
    appPhotoURL = json['appPhotoURL'];
    permalink = json['permalink'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extId'] = extId;
    data['appName'] = appName;
    data['appPhotoURL'] = appPhotoURL;
    data['permalink'] = permalink;
    data['type'] = type;
    return data;
  }
}
