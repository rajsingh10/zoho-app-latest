class TicketRepliesModal {
  List<Data>? data;

  TicketRepliesModal({this.data});

  TicketRepliesModal.fromJson(Map<String, dynamic> json) {
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
  String? channel;
  bool? canReply;
  String? contentType;
  bool? hasAttach;
  String? status;
  String? summary;
  Author? author;
  String? attachmentCount;
  String? respondedIn;
  bool? isDescriptionThread;
  String? visibility;
  String? createdTime;
  String? direction;
  String? cc;
  String? responderId;
  String? bcc;
  String? to;
  String? fromEmailAddress;
  bool? isForward;

  Data(
      {this.id,
      this.channel,
      this.canReply,
      this.contentType,
      this.hasAttach,
      this.status,
      this.summary,
      this.author,
      this.attachmentCount,
      this.respondedIn,
      this.isDescriptionThread,
      this.visibility,
      this.createdTime,
      this.direction,
      this.cc,
      this.responderId,
      this.bcc,
      this.to,
      this.fromEmailAddress,
      this.isForward});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channel = json['channel'];
    canReply = json['canReply'];
    contentType = json['contentType'];
    hasAttach = json['hasAttach'];
    status = json['status'];
    summary = json['summary'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    attachmentCount = json['attachmentCount'];
    respondedIn = json['respondedIn'];
    isDescriptionThread = json['isDescriptionThread'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['channel'] = channel;
    data['canReply'] = canReply;
    data['contentType'] = contentType;
    data['hasAttach'] = hasAttach;
    data['status'] = status;
    data['summary'] = summary;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['attachmentCount'] = attachmentCount;
    data['respondedIn'] = respondedIn;
    data['isDescriptionThread'] = isDescriptionThread;
    data['visibility'] = visibility;
    data['createdTime'] = createdTime;
    data['direction'] = direction;
    data['cc'] = cc;
    data['responderId'] = responderId;
    data['bcc'] = bcc;
    data['to'] = to;
    data['fromEmailAddress'] = fromEmailAddress;
    data['isForward'] = isForward;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['photoURL'] = photoURL;
    data['type'] = type;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}
