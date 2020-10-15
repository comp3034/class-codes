class Message {
  String body;
  bool wasRead;
  bool isOrigin;
  DateTime sendedAt;
  // DateTime readAt;

  Message({
    this.body,
    this.wasRead = false,
    this.isOrigin = false,
    this.sendedAt,
  });
}
