// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$deckAtom = Atom(name: 'HomeStoreBase.deck');

  @override
  DeckModel? get deck {
    _$deckAtom.reportRead();
    return super.deck;
  }

  @override
  set deck(DeckModel? value) {
    _$deckAtom.reportWrite(value, super.deck, () {
      super.deck = value;
    });
  }

  final _$cardModelAtom = Atom(name: 'HomeStoreBase.cardModel');

  @override
  CardModel? get cardModel {
    _$cardModelAtom.reportRead();
    return super.cardModel;
  }

  @override
  set cardModel(CardModel? value) {
    _$cardModelAtom.reportWrite(value, super.cardModel, () {
      super.cardModel = value;
    });
  }

  final _$getDeckAsyncAction = AsyncAction('HomeStoreBase.getDeck');

  @override
  Future<void> getDeck() {
    return _$getDeckAsyncAction.run(() => super.getDeck());
  }

  final _$getCardsAsyncAction = AsyncAction('HomeStoreBase.getCards');

  @override
  Future<void> getCards(DeckModel deckModel) {
    return _$getCardsAsyncAction.run(() => super.getCards(deckModel));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setCardModel(dynamic value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCardModel');
    try {
      return super.setCardModel(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deck: ${deck},
cardModel: ${cardModel}
    ''';
  }
}
