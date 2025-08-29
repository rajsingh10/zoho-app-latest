class TicketRepliesModal {
  List<Data>? data;

  TicketRepliesModal({this.data});

  TicketRepliesModal.fromJson(Map<String, dynamic> json) {
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
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['respondedIn'] = this.respondedIn;
    data['isDescriptionThread'] = this.isDescriptionThread;
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
