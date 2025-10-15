class ReplyTicketModal {
  String? content;
  String? id;
  String? channel;
  bool? canReply;
  String? contentType;
  bool? hasAttach;
  String? status;
  String? summary;
  String? fromEmailAddress;

  ReplyTicketModal(
      {this.content,
      this.id,
      this.channel,
      this.canReply,
      this.contentType,
      this.hasAttach,
      this.status,
      this.summary,
      this.fromEmailAddress});

  ReplyTicketModal.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    id = json['id'];
    channel = json['channel'];
    canReply = json['canReply'];
    contentType = json['contentType'];
    hasAttach = json['hasAttach'];
    status = json['status'];
    summary = json['summary'];
    fromEmailAddress = json['fromEmailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['id'] = id;
    data['channel'] = channel;
    data['canReply'] = canReply;
    data['contentType'] = contentType;
    data['hasAttach'] = hasAttach;
    data['status'] = status;
    data['summary'] = summary;
    data['fromEmailAddress'] = fromEmailAddress;
    return data;
  }
}
