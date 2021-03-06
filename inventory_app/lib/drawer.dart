import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inventoryapp/contactUs.dart';
import 'package:inventoryapp/currentUserProfileData.dart';
import 'package:inventoryapp/inventory.dart';
import 'package:inventoryapp/profile.dart';
import 'package:inventoryapp/profile_noGoogle.dart';
import 'package:inventoryapp/requests.dart';
import 'package:inventoryapp/splash.dart';

class MyDrawer extends StatelessWidget{
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount account;
  GoogleSignInAuthentication auth;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height)*0.3 , left: 20.00),
                  child: ListTile(
                    title: Text(
                      'My Profile',
                      textScaleFactor: 1.5,
                    ),
                    onTap: (){
                      myProfileOnTap(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.00),
                  child: ListTile(
                    title: Text(
                      'Requests',
                      textScaleFactor: 1.5,
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Requests()
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.00),
                  child: ListTile(
                    title: Text(
                      'Inventory',
                      textScaleFactor: 1.5,
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => InventoryScreen()
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.00),
                  child: ListTile(
                    title: Text(
                      'Contact Support',
                      textScaleFactor: 1.5,
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SendEmail()
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height)*0.2 , left: 20.00),
                  child: ListTile(
                    title: Text(
                      'Log Out',
                      textScaleFactor: 1.5,
                    ),
                    onTap: () async{
                      await googleSignIn.signOut();
                      //await googleSignIn.disconnect();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SplashScreen()
                      ));
                    },
                  ),
                )
              ],
            )
    );
  }

  void myProfileOnTap(BuildContext context){
    if(currentUserData.Password != null){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProfileScreenDirect()
      ));
    }
    else{
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProfileScreen()
      ));
    }
  }
}