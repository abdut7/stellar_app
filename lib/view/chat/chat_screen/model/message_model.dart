class Message {
  final String text;
  final DateTime timestamp;
  final bool isSent;
  final bool isDelivered;

  Message(this.text, {this.isSent = true, this.isDelivered = false})
      : timestamp = DateTime.now();
}