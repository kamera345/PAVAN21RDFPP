import 'package:flutter/material.dart';
import 'package:flutterassignment/Constants/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static const name = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Name:   Kamera Pavan',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('College:   IIITK, WEST BENGAL', style: kProfileTextStyle),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '4th year Computer Science and Engineering',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Mobile:   7995250994', style: kProfileTextStyle),
            SizedBox(
              height: 10.0,
            ),
            Text('Gmail:   pavankamera12@gmail.com', style: kProfileTextStyle),
            Text(
              'Address: \n village: Thimmapur\n Mandal: Jannaram\n District: Mancherial\n State: Telangana\n 504206',
              style: kProfileTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
