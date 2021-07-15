import 'dart:convert';

import 'package:desafio_deck_of_cards/app/interfaces/deck_repository_interface.dart';
import 'package:desafio_deck_of_cards/app/models/deck_model.dart';
import 'package:http/http.dart' as http;

class DeckRepository implements IDeckRepository {
  @override
  Future<DeckModel> getDeck() async {
    DeckModel? deck;
    var url = Uri.parse(
        'http://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1');

    var response = await http.get(url);
    print('====== GET DECK');
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      deck = DeckModel.fromJson(decode);
    }

    return deck!;
  }
}
