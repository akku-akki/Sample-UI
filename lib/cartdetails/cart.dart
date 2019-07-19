import 'package:flutter/material.dart';
import 'dart:async';
import 'package:foods1/help/database_helper.dart';
import 'package:foods1/help/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:foods1/sembast_helper.dart';
import 'package:foods1/crudsop.dart';

class cartlist extends StatefulWidget {


  @override
  _cartlistState createState() => _cartlistState();
}

class _cartlistState extends State<cartlist> {
 // DatabaseHelper databaseHelper = DatabaseHelper();
 Operation opp = Operation();
 AppDatabase app_db = AppDatabase.instance;
  List<Notes> notelist;
  int count =0;

   @override
  Widget build(BuildContext context) {
     if (notelist==null){
       notelist = List<Notes>();
       updateListView();
     }
     return Scaffold(
         appBar:AppBar(title: Text("My Cart",style: TextStyle(fontSize: 25,color: Colors.white,
         ),),backgroundColor: Colors.orangeAccent,leading: Icon(Icons.shopping_cart),)
             ,body: Column(
               children: <Widget>[
                 getNoteListView(),
                 Material(
                   color: Colors.orange.withOpacity(0.5),
                   elevation: 14.0,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(40.0),
                     topRight: Radius.circular(40.0),
                     
                   ),
                   shadowColor: Colors.yellowAccent,
                   child: _buildInitContent(context),
                                    )
                                  ],
                                ),
                                
                        );
                      }
                   
                   
                   
                     void updateListView() {
                       final Future <Database> dbFuture = app_db.openDatabase();
                       dbFuture.then((database){
                         Future<List<Notes>> notelistFuture = opp.getAllSortedByName();
                         notelistFuture.then((noteList){
                           setState(() {
                             this.notelist = noteList;
                             this.count = noteList.length;
                           });
                         });
                       });
                     }
                   
                     ListView getNoteListView() {
                        return ListView.builder(itemCount: count,
                        itemBuilder: (BuildContext context,int position){
                          return Card(
                            color: Colors.white,
                            elevation: 2.0,
                            child: ListTile(
                              title: Text(this.notelist[position].name,style: TextStyle(fontSize: 18,color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold),),
                              subtitle: Text(this.notelist[position].price.toString(),style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,
                              fontSize: 15),),
                              trailing: IconButton(icon: Icon(Icons.remove_circle), onPressed: (){
                                _delete(context,notelist[position]);
                              }),
                            ),
                          );
                        },);
                     }
                   
                     void _delete(BuildContext context, Notes notelist) async{
                   int result = await opp.delete(notelist.id);
                   if (result!=0){
                     updateListView();
                   }
                   
                     }
                     }
                   
                 Widget  _buildInitContent(BuildContext context) {
                   return Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 height: 250,
                 child: Column(
                   children: <Widget>[
                   
                   ],
                 ),
                 
               ),
                   );
}


