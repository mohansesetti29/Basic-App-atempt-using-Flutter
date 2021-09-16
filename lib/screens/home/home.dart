
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screens/home/bro_list.dart';
import 'package:firebase/models/bro.dart';


class Home extends StatelessWidget {

 final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context,builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 60.0),
        child:SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Bro>>.value(
      value:DatabaseService().bros,
      child:Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar:AppBar(
        title: Text('My App'),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        actions:<Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('logout'),
            onPressed: () async{
            await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon:Icon(Icons.settings),
            label:Text('settings'),
            onPressed:()=>_showSettingsPanel(),
          )
        ],
      )
          body:BroList(),
    ),
    );
  }
}