class CardModel {
  final bool success;
  final String deckId;
  final List<Cards> cards;
  final int remaining;

  CardModel(
      {required this.success,
      required this.deckId,
      required this.cards,
      required this.remaining});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    List<Cards> cards = [];
    if (json['cards'] != null) {
      json['cards'].forEach((v) {
        cards.add(Cards.fromJson(v));
      });
    }

    return CardModel(
        success: json['success'],
        deckId: json['deck_id'],
        cards: cards,
        remaining: json['remaining']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['deck_id'] = this.deckId;
    if (this.cards != null) {
      data['cards'] = this.cards.map((v) => v.toJson()).toList();
    }
    data['remaining'] = this.remaining;
    return data;
  }
}

class Cards {
  final String code;
  final String image;
  final Images images;
  final String value;
  final String suit;

  Cards(
      {required this.code,
      required this.image,
      required this.images,
      required this.value,
      required this.suit});

  factory Cards.fromJson(Map<String, dynamic> json) {
    var images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    return Cards(
        code: json['code'],
        image: json['image'],
        images: images!,
        value: json['value'],
        suit: json['suit']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['image'] = this.image;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['value'] = this.value;
    data['suit'] = this.suit;
    return data;
  }
}

class Images {
  final String svg;
  final String png;

  Images({required this.svg, required this.png});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(svg: json['svg'], png: json['png']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['svg'] = this.svg;
    data['png'] = this.png;
    return data;
  }
}
