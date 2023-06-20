import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/following.dart';
import 'package:provider_demo/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ListTile eachTile(Following following, String name, String initials){
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(initials),
      ),
      trailing: IconButton(
        icon: (following.followingList.contains(name)) ? Icon(Icons.check): Icon(Icons.add),
        onPressed: (){
           if(following.followingList.contains(name)){
             following.remove(name);
           } else {
             following.add(name);
           }
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Following following = Provider.of<Following>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Providers'),
        centerTitle: true,
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen(),
                ),
            );
          }, child: Text('Next'))
        ],
      ),
      body: Consumer<Following>(
        builder: (BuildContext context, Following value, Widget? child){
          return ListView(
            children: <Widget>[
              eachTile(following, "Kondwani Nantchito", "KN"),
              eachTile(following, "Robert Nantchito", "RN"),
              eachTile(following, "Gusher Nantchito", "GN"),
              eachTile(following, "Esther Chitedze", "EC"),
              eachTile(following, "Hope Nantchito", "HN"),
              eachTile(following, "Alinafe Nantchito", "AN"),
              eachTile(following, "Caroline Nantchito", "CN"),
            ],
          );
        },
      ),
    );
  }
}
