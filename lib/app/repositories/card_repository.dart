import 'dart:convert';

import 'package:desafio_deck_of_cards/app/interfaces/cards_repository_interface.dart';
import 'package:desafio_deck_of_cards/app/models/deck_model.dart';
import 'package:desafio_deck_of_cards/app/models/card_model.dart';
import 'package:http/http.dart' as http;

class CardRepository implements ICardsRepository {
  @override
  Future<CardModel> getRemainingCards(DeckModel deckModel) async {
    CardModel? cardModel;
    final String codDeck = deckModel.deckId;

    var url =
        Uri.parse('http://deckofcardsapi.com/api/deck/$codDeck/draw/?count=5');

    var response = await http.get(url);

    print('===== GET CARDS');

    if (response.statusCode == 200) {
      print(response.body);

      var decode = jsonDecode(response.body);
      cardModel = CardModel.fromJson(decode);
    }

    // TODO: implement getRemainingCards
    return cardModel!;
  }
}
