import 'package:flutter/material.dart';
class FavouriteQuote extends StatefulWidget {
  const FavouriteQuote({Key? key}) : super(key: key);

  @override
  State<FavouriteQuote> createState() => _FavouriteQuoteState();
}

class _FavouriteQuoteState extends State<FavouriteQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Favourite")),
    );
  }
}
