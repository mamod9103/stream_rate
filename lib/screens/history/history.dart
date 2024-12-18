import 'package:flutter/material.dart';
import 'package:stream_rate/commonView/custom_fill_button.dart';

import 'package:stream_rate/commonView/item_card.dart';
import 'package:stream_rate/commonView/item_card_model.dart';

import 'package:stream_rate/utils/utils.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<History> {
  List<ItemCardModel> items = [
    ItemCardModel(
        image: 'assets/images/item_card.png',
        itemName: 'Jaws',
        year: 1978,
        imdb: 8.1,
        metacritic: 7.3,
        rottenTomatoes: 97,
        letterboxd: 3.6),
    ItemCardModel(
        image: 'assets/images/item_card.png',
        itemName: 'Star Wars',
        year: 1977,
        imdb: 8.7,
        metacritic: 6.9,
        rottenTomatoes: 94,
        letterboxd: 4.4),
    ItemCardModel(
        image: 'assets/images/item_card.png',
        itemName: 'Toy Story 2',
        year: 1999,
        imdb: 7.9,
        metacritic: 8.5,
        rottenTomatoes: 98,
        letterboxd: 4.5),
    ItemCardModel(
        image: 'assets/images/item_card.png',
        itemName: 'Casablanca',
        year: 1942,
        imdb: 7.7,
        metacritic: 7.9,
        rottenTomatoes: 88,
        letterboxd: 4.0),
    ItemCardModel(
        image: 'assets/images/item_card.png',
        itemName: 'Parasite',
        year: 2019,
        imdb: 9.7,
        metacritic: 6.6,
        rottenTomatoes: 86,
        letterboxd: 3.2),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        automaticallyImplyLeading: false,
        foregroundColor: colorBlack,
        toolbarHeight: 80,
        elevation: 0,
        title: Stack(
          children: [
            const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'History',
                  style: TextStyle(fontSize: 24, color: colorWhite),
                ),
              ),
            ),
            Positioned(
              left: 15,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 36,
                  width: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: colorWhite.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child:
                        Icon(Icons.arrow_back_ios, size: 16, color: colorWhite),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: colorMainBackground,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ListView(
              children: items.map((item) => ItemCard(item: item)).toList(),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 90,
              width: deviceWidth,
              decoration: const BoxDecoration(color: colorItemCard),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('You have only 3 credits left',
                          style: TextStyle(color: colorWhite, fontSize: 16)),
                      Row(
                        children: const [
                          Text('Go Unlimited for ',
                              style:
                                  TextStyle(color: colorWhite, fontSize: 16)),
                          Text('\$2.99',
                              style: TextStyle(color: colorDestination)),
                          Text('eek',
                              style:
                                  TextStyle(color: colorWhite, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  CustomFillButton(
                      child: Row(
                    children: const [
                      Text('SUBSCRIBE',
                          style: TextStyle(
                              color: colorWhite, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios, size: 15, color: colorWhite)
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}