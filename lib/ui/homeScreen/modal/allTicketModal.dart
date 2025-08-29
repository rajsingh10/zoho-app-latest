class MyTickitModal {
  List<Data>? data;

  MyTickitModal({this.data});

  MyTickitModal.fromJson(Map<String, dynamic> json) {
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
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    lastThread = json['lastThread'];
    customerResponseTime = json['customerResponseTime'];
    isArchived = json['isArchived'];
    webUrl = json['webUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticketNumber'] = this.ticketNumber;
    data['layoutId'] = this.layoutId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['subject'] = this.subject;
    data['status'] = this.status;
    data['statusType'] = this.statusType;
    data['createdTime'] = this.createdTime;
    data['category'] = this.category;
    data['language'] = this.language;
    data['subCategory'] = this.subCategory;
    data['priority'] = this.priority;
    data['channel'] = this.channel;
    data['dueDate'] = this.dueDate;
    data['responseDueDate'] = this.responseDueDate;
    data['commentCount'] = this.commentCount;
    data['sentiment'] = this.sentiment;
    data['threadCount'] = this.threadCount;
    data['closedTime'] = this.closedTime;
    data['onholdTime'] = this.onholdTime;
    data['accountId'] = this.accountId;
    data['departmentId'] = this.departmentId;
    data['contactId'] = this.contactId;
    data['productId'] = this.productId;
    data['assigneeId'] = this.assigneeId;
    data['teamId'] = this.teamId;
    data['relationshipType'] = this.relationshipType;
    data['channelCode'] = this.channelCode;
    data['isSpam'] = this.isSpam;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['lastThread'] = this.lastThread;
    data['customerResponseTime'] = this.customerResponseTime;
    data['isArchived'] = this.isArchived;
    data['webUrl'] = this.webUrl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['extId'] = this.extId;
    data['appName'] = this.appName;
    data['appPhotoURL'] = this.appPhotoURL;
    data['permalink'] = this.permalink;
    data['type'] = this.type;
    return data;
  }
}
