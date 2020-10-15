import 'package:emp_care/color/color.dart';
import 'package:emp_care/screens/add_employ.dart';
import 'package:emp_care/screens/dashboard.dart';
import 'package:emp_care/screens/members.dart';
import 'package:emp_care/screens/requests.dart';
import 'package:emp_care/screens/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
enum SelectedMenu {dashboard, requests, members, settings,add}
class _HomeState extends State<Home> {

  SelectedMenu selectedMenu = SelectedMenu.dashboard;

  bool clicked = false;
  int selectedIndex = 0;





//  Widget listTile(int index) {
//   return  Column(
//     children: [
//
//
//     ],
//   );
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("EMPLOYEE MANAGER" ,
            style: TextStyle(
              letterSpacing: 3,
              color: black,
              fontWeight:  FontWeight.w500,
            ),
        ),
        bottomOpacity: 0.5,
        elevation: 0.5,

        actions: [
          IconButton(
            onPressed : (){

            },
            icon : Icon(Icons.notifications, color : black),
          ),
          SizedBox(width: 10,),
          CircleAvatar(
             radius: 15,
          ),

          SizedBox(width: 20,)
        ],

      ),

     body: Container(
       height: MediaQuery.of(context).size.height,

       color :white,
       child: screen(),
     ),

//      body : ListView(
//        children: [
//          Row(
//            children: [
//              Container(
//                width: MediaQuery.of(context).size.width*0.15,
//                height: MediaQuery.of(context).size.height,
//                color : lightGreen,
//
//                child: Column(
//                  children: [
//
//                    SizedBox(height: 40,),
//
//                    //button
//                    FractionallySizedBox(
//                      widthFactor: 0.7,
//                      child: Container(
//                        height: 40,
//                        child: RaisedButton(
//                          color : Color(0xff7d22e2),
//                          onPressed: (){
//                            setState(() {
//                              selectedMenu = SelectedMenu.add;
//                            });
//                          },
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Flexible(
//                                child: Icon(
//                                  Icons.add,
//                                  color: white,
//                                ),
//                              ),
//                              SizedBox(width : 2),
//                              Flexible(
//                                child: Text(
//                                  "Add",
//                                   overflow: TextOverflow.fade,
//                                  style: TextStyle(
//                                    color : white,
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                    //button
//
//
//                    //Side List...
//
//                   SizedBox(height: 60),
//
//                    ListTile(
//                      onTap : () {
//                        setState(() {
//                          selectedMenu = SelectedMenu.dashboard;
//                        });
//                      },
//                      leading  : Icon(Icons.dashboard),
//                      enabled: true,
//                      tileColor : selectedMenu == SelectedMenu.dashboard ?  Colors.blue : Colors.white,
//                      title : Text("Dashboard"),
//                    ),
//
//                    SizedBox(height: 25,),
//
//                    ListTile(
//                      onTap : () {
//                        setState(() {
//                          selectedMenu = SelectedMenu.requests;
//                        });
//                      },
//                      enabled: true,
//                      tileColor :selectedMenu == SelectedMenu.requests ?  Colors.blue : Colors.white,
//                      leading: Icon(Icons.request_page_rounded),
//                      title : Text("Requests"),
//                    ),
//
//                    SizedBox(height: 25,),
//
//
//                    ListTile(
//                      onTap : () {
//                        setState(() {
//                          selectedMenu = SelectedMenu.members;
//                        });
//                      },
//                      leading: Icon(Icons.people),
//                      enabled: true,
//                      tileColor :selectedMenu == SelectedMenu.members ?  Colors.blue : Colors.white,
//                      title : Text("Members"),
//                    ),
//
//                    SizedBox(height: 25,),
//
//                    Flexible(
//                      child: ListTile(
//                        onTap : () {
//                          setState(() {
//                            selectedMenu = SelectedMenu.settings;
//                          });
//                        },
//                        leading: Icon(Icons.settings),
//                        enabled: true,
//                        tileColor :selectedMenu == SelectedMenu.settings ?  Colors.blue : Colors.white,
//                        title : Text("Settings"),
//                      ),
//                    ),
//
//                    SizedBox(height: 40,),
//
//
//                  ],
//                ),
//              ),
//

//
//            ],
//          ),
//        ],
//      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedMenu = SelectedMenu.add;
          });

        },

        child: Icon(Icons.add),
        elevation: 8.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color : Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(

              onPressed: (){
                setState(() {
                  selectedMenu = SelectedMenu.dashboard;
                });
              },

              icon : Icon(
                Icons.dashboard,
                size: 28,
                color : selectedMenu == SelectedMenu.dashboard ?  Colors.blue : Colors.black,

              ),
            ),
            IconButton(

              onPressed: (){
                setState(() {
                  selectedMenu = SelectedMenu.members;
                });
              },

              icon : Icon(
                Icons.people,
                size: 28,
                color : selectedMenu == SelectedMenu.members ?  Colors.blue : Colors.black,

              ),
            ),
            IconButton(

                onPressed: (){
                  setState(() {
                    selectedMenu = SelectedMenu.requests;
                  });
                },

              icon  : Icon(
                Icons.request_quote_outlined,
                size: 28,
                color : selectedMenu == SelectedMenu.requests ?  Colors.blue : Colors.black,

              )
            ),
            IconButton(

                onPressed: (){
                  setState(() {
                    selectedMenu = SelectedMenu.settings;
                  });
                },

                icon  : Icon(
                  Icons.settings,
                  size: 28,
                  color : selectedMenu == SelectedMenu.settings ?  Colors.blue : Colors.black,

                )
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),

      ),


    );
  }

  Widget screen() {
    if(selectedMenu == SelectedMenu.dashboard) {
      return DashBoard();
    }
    if(selectedMenu == SelectedMenu.members) {
      return Members();
    }
    if(selectedMenu == SelectedMenu.settings) {
      return Settings();
    }
    if(selectedMenu == SelectedMenu.requests){
       return Requests();
    }
    if(selectedMenu == SelectedMenu.add) {
      return AddEmploy();
    }
    return Container();

  }


}


