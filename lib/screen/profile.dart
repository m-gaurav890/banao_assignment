import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const  SafeArea(
      child: Scaffold(
        body: Center(
            child: Text("This is my Profile Screen",style: TextStyle(
              fontSize: 20
            ),),),
      ),
    );
  }
}
