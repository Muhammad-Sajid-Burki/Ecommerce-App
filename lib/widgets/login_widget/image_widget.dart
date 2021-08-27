import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/homepage_hey.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
