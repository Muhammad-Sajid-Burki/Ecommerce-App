import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              'assets/login_image.png',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "UserName",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Hi Codepur');
                    },
                    child: Text('Login'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
