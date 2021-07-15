import 'package:desafio_deck_of_cards/app/models/card_model.dart';
import 'package:desafio_deck_of_cards/app/models/deck_model.dart';
import 'package:desafio_deck_of_cards/app/repositories/card_repository.dart';
import 'package:desafio_deck_of_cards/app/repositories/deck_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  DeckModel? deck;

  @observable
  CardModel? cardModel;

  @action
  void setCardModel(value) => cardModel = value;

  @action
  Future<void> getDeck() async {
    DeckRepository repository = DeckRepository();

    deck = await repository.getDeck();

    if (deck != null) {
      getCards(deck!);
    }
  }

  @action
  Future<void> getCards(DeckModel deckModel) async {
    CardRepository repository = CardRepository();
    CardModel card;
    card = await repository.getRemainingCards(deckModel);
    setCardModel(card);
  }
}
