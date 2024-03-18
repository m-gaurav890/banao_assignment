import 'package:banao_assignment/screen/chat.dart';
import 'package:banao_assignment/screen/home_screen.dart';
import 'package:banao_assignment/screen/hub.dart';
import 'package:banao_assignment/screen/learn.dart';
import 'package:banao_assignment/screen/profile.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndexValue=0;
  List screenList= [
    const Home(),const Learn(),const Hub(),const Chat(),const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndexValue],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndexValue ,
        onTap: (index){
          setState(() {
            currentIndexValue=index;
          });
        },
        elevation: 100,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home ),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_sharp,),label: "Learn"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: "Hub"),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
      ),
    );
  }
}

