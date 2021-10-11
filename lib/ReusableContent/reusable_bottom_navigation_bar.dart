import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReusableBottomNavBar extends StatefulWidget {
  const ReusableBottomNavBar({Key? key}) : super(key: key);

  @override
  _ReusableBottomNavBarState createState() => _ReusableBottomNavBarState();
}

class _ReusableBottomNavBarState extends State<ReusableBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'Assets/bulb.svg',
              ),
              const SizedBox(width: 60.0,),
              SvgPicture.asset(
                'Assets/Icon feather-home.svg',
              ),
              const SizedBox(width: 60.0,),
              SvgPicture.asset(
                'Assets/Icon feather-settings.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
