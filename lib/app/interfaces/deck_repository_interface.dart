import 'package:desafio_deck_of_cards/app/models/deck_model.dart';

abstract class IDeckRepository {
  Future<DeckModel> getDeck();
}
