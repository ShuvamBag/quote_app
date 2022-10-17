import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/Screens/Author_Quote.dart';
import 'package:quote_app/Screens/Favourite_Quote.dart';
import 'package:quote_app/Screens/Search_Quote.dart';


class intro_page extends StatefulWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {
  @override
  Widget build(BuildContext context) {
    double height = 40;
    double width = 40;
    return
      Scaffold(

        body:
        Stack(children: [
        Container(child: Image.asset("assets/background1.png",fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        )),
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 180,),
                Image.asset(
                  "assets/quote.png",
                  height: height,
                  width: width,
                ),
                SizedBox(
                  height: 50,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 50, color: Colors.black),
                    ),
                    children: [
                      TextSpan(text: "Get\n"),
                      TextSpan(
                          text: "Inspired",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AuthorQuote()));
                    },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(63.0,15,63,15),
                          child: Text("Author Quote",style: GoogleFonts.lato(fontSize: 20,color: Colors.white),),
                        ),
                        style: ButtonStyle(

                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),

                              )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SearchQuote()));
                    },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(47.0,15,47,15),
                          child: Text("Search any Quote",style: GoogleFonts.lato(fontSize: 20,color: Colors.white),),
                        ),
                        style: ButtonStyle(

                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),

                              )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){

                    },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(75.0,15,75,15),
                          child: Text("Favourites",style: GoogleFonts.lato(fontSize: 20,color: Colors.white),),
                        ),
                        style: ButtonStyle(

                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),

                              )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

    ],)

    );
  }
}
