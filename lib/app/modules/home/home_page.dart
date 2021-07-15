import 'package:desafio_deck_of_cards/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final HomeStore store = Modular.get();

  _HomePageState() {
    store.getDeck();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Deck Of Cards',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      shadows: [Shadow(color: Colors.black, blurRadius: 20)]),
                ),
                Text(
                  'Desenvolvido por Victor B. Pereira',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      shadows: [Shadow(color: Colors.black, blurRadius: 20)]),
                ),
                store.deck == null
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 1,
                      ),
                store.cardModel == null
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: _getData,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: store.cardModel!.cards.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.infinity,
                                  height: 300,
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Image.network(
                                      store.cardModel!.cards[index].image),
                                );
                              }),
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _getData() async {
    await store.getCards(store.deck!);
  }
}
