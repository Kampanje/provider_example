import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/following.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Consumer<Following>(
        builder: (BuildContext context, Following value, Widget? child){
          return ListView.builder(
            itemCount: value.followingList.length + 1,
            itemBuilder: (context, index){
                if(index == 0){
                  return const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text("You are following")
                  );
                }
                else {
                  return Center(
                    child: Text(value.followingList[index - 1]),
                  );
                }
            },
          );
        }
      )
    );
  }
}
