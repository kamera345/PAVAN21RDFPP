import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterassignment/Constants/constants.dart';
import 'package:flutterassignment/ReusableContent/reusable_bottom_navigation_bar.dart';
import 'package:flutterassignment/Screens/profile.dart';
import 'package:flutterassignment/Screens/room_screen.dart';
import '../Data/home_screen_roomcards_data.dart';




/*
* This is the home screen
* In this the data is taken from the Data/
* Constants are taken from the Constants/constants.dart file
*
* */


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const name = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
          color: Color(0xff2c24c7),
        ),
        child: Stack(
          children: <Widget>[
            /*
                * The below is the circles background image
            * */
            SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  'Assets/Circles.svg',
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            Column(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 50.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: const <Widget>[
                            Text('Control\n Panel', style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.0,
                            ),),
                          ],
                        ),

                        /*
                        * The below is the user image
                        * */
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Profile.name);
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: SvgPicture.asset(
                              'Assets/user.svg',
                            ),

                          ),
                        ),
                      ],),
                  ),
                ),

                /*
                * The below widget contains all the data
                * */
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
                          child: Text('All Rooms', style:kHomeScreenSubHeadingTestStyle,
                          ),
                        ),

                        /*
                        * The below grid view is to display the different types or rooms data
                        * The data for those is taken from the Data/home_screen_roomcards_data.dart file
                        * By clicking the room card user will redirect to the room screen
                        *
                        * */
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0, top: 10.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisExtent: 180,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemCount: content.length,
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: (){
                                   Navigator.pushNamed(context, RoomScreeen.name);
                                  },
                                  child: Container(
                                    decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                                          child: SvgPicture.asset(
                                            content[index]['icon'],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 35.0, left: 20.0),
                                          child: Text(content[index]['text1'], style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w800,
                                          ),),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                                          child: Text(content[index]['text2'], style: const TextStyle(
                                            color: Colors.orangeAccent,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w800,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 80.0,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
           //The below Navigation bar is taken from the Reusable/
           const ReusableBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
