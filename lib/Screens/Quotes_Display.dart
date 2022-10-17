import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/Screens/intro_page.dart';
import 'Search_Quote.dart';
import 'package:http/http.dart' as http;

 Map? mapResponse;
 Map? dataResponse;
 List? listResponse;
 bool isFavourite = false;
 int key=0;
 int count =0;
class DisplayQuotes extends StatefulWidget {
  final String topic;
  const DisplayQuotes({Key? key, required this.topic}) : super(key: key);
  @override
  State<DisplayQuotes> createState() => _DisplayQuotesState(topic);
}

class _DisplayQuotesState extends State<DisplayQuotes> {
  String topic1;
  _DisplayQuotesState(this.topic1);


  Future apicall()async{

    http.Response response;
    response = await http.get(Uri.parse('https://api.quotable.io/search/quotes?query=$topic1'));
    if(response.statusCode == 200)
      {
        setState(() {
          
            mapResponse = jsonDecode(response.body);
            listResponse = mapResponse!["results"];
            count = mapResponse!["count"];
        });
      }
    
  }
  @override
  void initState(){
    super.initState();
    apicall();

  }

  @override
  Widget build(BuildContext context) {
    if(count==0){
       return Scaffold(
         body: SafeArea(
           child: Column(
             children: [
               SizedBox(height: 200,),
               Text("Oops we did not get you !!",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w500),),
               SizedBox(height: 50,),
               Container(
                 child: Center(

                   child: Image.asset("assets/error.png",height: 200,width: 200,)
                 ),
               ),
               SizedBox(height: 50,),
               Text("Try Again",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.bold),),
               SizedBox(height: 20,),
               GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => intro_page()));
                  },
                   child: Image.asset("assets/retry.png",height:50,width: 50,))

             ],
           ),
         ),
       );
    }
    else {
      return Scaffold(
        body:

        Stack(
          children: [
            Image.asset("assets/background1.png", fit: BoxFit.fill,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,),
            SafeArea(
              child: SingleChildScrollView(

                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 20),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 200,),
                      Image.asset(
                        "assets/quote.png",
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      listResponse == null ? Container(
                          margin: EdgeInsets.only(
                              top: 50, left: 100, right: 20),
                          child: Image.asset("assets/loading.gif"))
                          : Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(listResponse![key]['content'].toString(),
                          style: GoogleFonts.fuzzyBubbles(fontSize: 40,
                            fontWeight: FontWeight.w700,),),
                      ),
                      SizedBox(height: 40,),
                      listResponse == null ? Container() :
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,


                          children: [


                            Text("~ ", style: GoogleFonts.ballet(
                                fontWeight: FontWeight.bold, fontSize: 20),),

                            Text(listResponse![key]['author'].toString(),
                              style: GoogleFonts.lato(fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700),),

                          ],
                        ),
                      ),
                      SizedBox(height: 70,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() =>
                              isFavourite ? isFavourite = false : isFavourite =
                              true);
                            },

                            child: isFavourite == false ? Image.asset(
                              "assets/favourite.png", height: 50, width: 50,) :
                            Image.asset(
                              "assets/favouritefilled.png", height: 50,
                              width: 50,),
                          ),
                          SizedBox(width: 220,),
                          GestureDetector(
                              onTap: () {
                                setState(() =>
                                key == count - 1 ? key = 0 : key++,

                                );
                                setState(() =>
                                isFavourite = false,


                                );
                              },
                              child: Image.asset(
                                "assets/rightarrow.png", height: 50,
                                width: 50,)),
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ],

        ),

      );
    }

  }
}
