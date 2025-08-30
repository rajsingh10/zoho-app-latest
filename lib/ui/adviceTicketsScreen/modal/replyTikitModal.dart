class ReplyTikitModal {
  String? content;
  String? id;
  String? channel;
  bool? canReply;
  String? contentType;
  bool? hasAttach;
  String? status;
  String? summary;
  Author? author;
  String? attachmentCount;
  var channelRelatedInfo;
  String? respondedIn;
  var readReceipts;
  var impersonatedUser;
  bool? isDescriptionThread;
  bool? isContentTruncated;
  Source? source;
  String? visibility;
  String? createdTime;
  String? direction;
  String? cc;
  String? responderId;
  String? bcc;
  String? to;
  String? fromEmailAddress;
  bool? isForward;

  ReplyTikitModal(
      {this.content,
      this.id,
      this.channel,
      this.canReply,
      this.contentType,
      this.hasAttach,
      this.status,
      this.summary,
      this.author,
      this.attachmentCount,
      this.channelRelatedInfo,
      this.respondedIn,
      this.readReceipts,
      this.impersonatedUser,
      this.isDescriptionThread,
      this.isContentTruncated,
      this.source,
      this.visibility,
      this.createdTime,
      this.direction,
      this.cc,
      this.responderId,
      this.bcc,
      this.to,
      this.fromEmailAddress,
      this.isForward});

  ReplyTikitModal.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    id = json['id'];
    channel = json['channel'];
    canReply = json['canReply'];
    contentType = json['contentType'];
    hasAttach = json['hasAttach'];
    status = json['status'];
    summary = json['summary'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    attachmentCount = json['attachmentCount'];
    channelRelatedInfo = json['channelRelatedInfo'];
    respondedIn = json['respondedIn'];
    readReceipts = json['readReceipts'];
    impersonatedUser = json['impersonatedUser'];
    isDescriptionThread = json['isDescriptionThread'];
    isContentTruncated = json['isContentTruncated'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    visibility = json['visibility'];
    createdTime = json['createdTime'];
    direction = json['direction'];
    cc = json['cc'];
    responderId = json['responderId'];
    bcc = json['bcc'];
    to = json['to'];
    fromEmailAddress = json['fromEmailAddress'];
    isForward = json['isForward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['id'] = this.id;
    data['channel'] = this.channel;
    data['canReply'] = this.canReply;
    data['contentType'] = this.contentType;
    data['hasAttach'] = this.hasAttach;
    data['status'] = this.status;
    data['summary'] = this.summary;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['attachmentCount'] = this.attachmentCount;
    data['channelRelatedInfo'] = this.channelRelatedInfo;
    data['respondedIn'] = this.respondedIn;
    data['readReceipts'] = this.readReceipts;
    data['impersonatedUser'] = this.impersonatedUser;
    data['isDescriptionThread'] = this.isDescriptionThread;
    data['isContentTruncated'] = this.isContentTruncated;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['visibility'] = this.visibility;
    data['createdTime'] = this.createdTime;
    data['direction'] = this.direction;
    data['cc'] = this.cc;
    data['responderId'] = this.responderId;
    data['bcc'] = this.bcc;
    data['to'] = this.to;
    data['fromEmailAddress'] = this.fromEmailAddress;
    data['isForward'] = this.isForward;
    return data;
  }
}

class Author {
  String? id;
  String? name;
  String? email;
  String? photoURL;
  String? type;
  String? firstName;
  String? lastName;

  Author(
      {this.id,
      this.name,
      this.email,
      this.photoURL,
      this.type,
      this.firstName,
      this.lastName});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photoURL = json['photoURL'];
    type = json['type'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoURL'] = this.photoURL;
    data['type'] = this.type;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class Source {
  var extId;
  var appName;
  var appPhotoURL;
  var permalink;
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
