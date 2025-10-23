class ThreadModal {
  String? content;
  String? id;
  String? channel;
  bool? canReply;

  ThreadModal({
    this.content,
    this.id,
    this.channel,
    this.canReply,
  });

  factory ThreadModal.fromJson(Map<String, dynamic> json) {
    return ThreadModal(
      content: json['content'] as String?,
      id: json['id'] as String?,
      channel: json['channel'] as String?,
      canReply: json['canReply'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'id': id,
      'channel': channel,
      'canReply': canReply,
    };
  }
}
