import "package:flutter/material.dart";

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text("Settings",
              style: TextStyle(
                  fontSize: 18
              ),),
            leading: Icon(Icons.settings,size: 28,),
          ),
          ListTile(
            title: Text("Share",
              style: TextStyle(
                  fontSize: 18
              ),),
            leading: Icon(Icons.share,size: 28,),
          ),
          ListTile(
            title: Text("Feedback",
              style: TextStyle(
                  fontSize: 18
              ),),
            leading: Icon(Icons.feedback,size: 28,),
          ),
          Divider(
            thickness: 4,
            indent: 50,
            endIndent: 50,
          ),
          Text("Version 1.0.0",style: TextStyle(
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
