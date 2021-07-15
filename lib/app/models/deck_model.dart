class DeckModel {
  final bool success;
  final String deckId;
  final int remaining;
  final bool shuffled;

  DeckModel(
      {required this.success,
      required this.deckId,
      required this.remaining,
      required this.shuffled});

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return DeckModel(
        success: json['success'],
        deckId: json['deck_id'],
        remaining: json['remaining'],
        shuffled: json['shuffled']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['deck_id'] = this.deckId;
    data['remaining'] = this.remaining;
    data['shuffled'] = this.shuffled;
    return data;
  }
}
