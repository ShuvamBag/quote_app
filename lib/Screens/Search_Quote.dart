import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/Screens/Quotes_Display.dart';

import '../models/search_model.dart';
var topic;
class SearchQuote extends StatefulWidget {
  const SearchQuote({Key? key}) : super(key: key);

  @override
  State<SearchQuote> createState() => _SearchQuoteState();
}

class _SearchQuoteState extends State<SearchQuote> {
  final topiccontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(children: [
        Image.asset("assets/background2.png",fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                Image.asset("assets/quote.png",scale: 5,),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: topiccontroller,
                    cursorColor: Colors.black,

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      labelText: ' Enter Topic',
                      hintText: "Love",

                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(width: 2,color: Colors.black38),
                      ),

                    ),




                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  topic = topiccontroller.text;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DisplayQuotes(topic: topic,)));

                },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Find Quotes",style: GoogleFonts.lato(fontSize: 20,color: Colors.white),),
                    ),
                    style: ButtonStyle(

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    )
                )
              ],
            ),
          ),
        ),
      ],

      ),
    );
  }
}
