import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterassignment/Constants/constants.dart';
import 'package:flutterassignment/Data/provider_model.dart';
import 'package:flutterassignment/Data/room_screen_colors_data.dart';
import 'package:flutterassignment/ReusableContent/reusable_bottom_navigation_bar.dart';
import 'package:flutterassignment/Screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../Data/room_screen_scenes_data.dart';


/*
* This is the room screen
* In this screen we used Provider package for state management
* (To change the light color when any of the color selected)
* And we have a slider to increase the brightness of the
*
*
* All the constanta are taken from the Constants/constants.dart file
*
* */

class RoomScreeen extends StatefulWidget{
  const RoomScreeen({Key? key}) : super(key: key);

  static const name = 'room_screen';

  @override
  _RoomScreeenState createState() => _RoomScreeenState();
}

class _RoomScreeenState extends State<RoomScreeen> with TickerProviderStateMixin {

  //This is for the the brightness of the bulb
  int brightness = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      //from the provider package
      return ChangeNotifierProvider(
        create: (_) => ChangeColor(),
        child: Scaffold(
          body: Container(
            color: const Color(0xff2c24c7),
            child: Stack(
              children: <Widget>[
                /*
                * The below is the circles background image
                * */
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'Assets/Circles.svg',
                    height: 400.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 60.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, HomePage.name);
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    /*
                                    * The below is the arrow svg file 
                                    * which helps the user to redirect to the previous page
                                    * */
                                    SvgPicture.asset(
                                      'Assets/Icon ionic-md-arrow-round-back.svg',
                                      width: 20.0,
                                      height: 30.0,
                                    ),
                                    const Text(' Bed',
                                        style: kRoomScreenTopHeadingTextStyle),
                                  ],
                                ),
                                const Text('Room',
                                    style: kRoomScreenTopHeadingTextStyle),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  '4 Lights',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0,
                                    color: Colors.yellowAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /*
                        * The below is from Provider package
                        * used to fetch data from the ChangeColor class
                        * To change the bulb color on user choice
                        * */
                        Consumer<ChangeColor>(builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: SvgPicture.asset(
                              'Assets/light bulb.svg',
                              height: 215.0,
                              color: value.color,
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    /*
                    * The below listview builder is the listview of the catogories
                    * which is a horizontal listview
                    * The data for this listview is taken from the Data/room_screen_scenes_data file
                    * content1 list
                    * */
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: content1.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: content1[index]['color'],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        content1[index]['icon'],
                                        color: content1[index]['color'] ==
                                            Colors.white
                                            ? Colors.indigo
                                            : Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Text(
                                        content1[index]['label'],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: content1[index]['color'] ==
                                              Colors.white
                                              ? Colors.indigo
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    Expanded(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                          color: Colors.white.withOpacity(0.9),
                        ),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 20.0),
                              child: Text(
                                'Intensity',
                                style: kRoomScreenSubHeadingsTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 10.0),
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'Assets/solution2.svg',
                                    height: 30.0,
                                    color: Colors.black26,
                                  ),

                                  /*
                                  * The below is the slider which is used to increase the intensity of the bulb
                                  * */
                                  Expanded(
                                    child: Slider(
                                      value: brightness.toDouble(),
                                      activeColor: Colors.orange[100 +
                                          brightness],
                                      //inactiveColor: Colors.orangeAccent[900-brightness],
                                      onChanged: (newValue) {
                                        setState(() {
                                          brightness = newValue.toInt();
                                        });
                                        //Provider.of<ChangeColor>(context).changeColors(Colors.orange);
                                      },
                                      min: 0,
                                      max: 400,
                                      divisions: 4,
                                    ),
                                  ),
                                  //The below is the bulb for which we change the intensity based of slider values
                                  SvgPicture.asset(
                                    'Assets/solution1.svg',
                                    height: 35.0,
                                    color: Colors.orange[brightness],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Text(
                                'Colors',
                                style: kRoomScreenSubHeadingsTextStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),

                            /*
                            * The below listview builder is to display the colors of different colors
                            * Which are used by the user to change the color of the bulb which is on top
                            * the Data for listview builder is taken from Data/room_screen_colors_data.dart file
                            * */
                            Container(
                              height: 40.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: colorscontent.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Provider.of<ChangeColor>(
                                                context, listen: false)
                                                .changeColors(
                                                colorscontent[index]['colors']);
                                          },
                                          child: Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(20.0),
                                              color: colorscontent[index]['colors'],
                                            ),
                                            child: Center(
                                              child: colorscontent[index]['image'] !=
                                                  null
                                                  ? SvgPicture.asset(
                                                  '${colorscontent[index]['image']}')
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Text(
                                'Scenes',
                                style: kRoomScreenSubHeadingsTextStyle,
                              ),
                            ),

                            /*
                            * The below is the grid view builder to display the scenes
                            * The data for this is taken from the Data/room_screen_scenes_data.dart file
                            * From scenesContent list
                            * */
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 20.0),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      mainAxisExtent: 80,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  itemCount: scenesContent.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            scenesContent[index]['color1'],
                                            scenesContent[index]['color2'],
                                          ],
                                          begin: const FractionalOffset(
                                              0.5, 1.0),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              scenesContent[index]['image'],
                                              color: Colors.white,
                                            ),
                                            Text(
                                              scenesContent[index]['label'],
                                              style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 80.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /*
                * This is the svg used to cover up the first image of light which is on top
                * of the screen
                * */
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SvgPicture.asset(
                        'Assets/Group 38.svg',
                        height: 168.0,
                      ),
                    ),
                  ],
                ),
                //This is the bottom navigation bar from Reuasble/
                const ReusableBottomNavBar(),
              ],
            ),
          ),
        ),
      );
    }
  }
