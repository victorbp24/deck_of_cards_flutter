import 'package:desafio_deck_of_cards/app/models/card_model.dart';
import 'package:desafio_deck_of_cards/app/models/deck_model.dart';

abstract class ICardsRepository {
  Future<CardModel> getRemainingCards(DeckModel deckModel);
}
