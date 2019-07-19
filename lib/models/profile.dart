import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foods1/models/profile_edit.dart';


class myprofile extends StatefulWidget {
  @override
  _myprofileState createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  var name="Enter name";
  var mobile= "Enter no";
  var add="Enter add";


/*@override
void initState(){
  this.getdata();
}*/


  getdata()async{
     final prefs =await SharedPreferences.getInstance();
     setState(() {
       name = prefs.getString("Name");
       mobile = prefs.getString("Mobile");
       add = prefs.getString("Add");
     });

  }






  @override

  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Material(child: Container(
      height: mheight,
      width: mwidth,
        decoration: BoxDecoration(
    //  borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
    begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.deepOrange,
          Colors.orange,

        ]
    )
    ),
    padding: EdgeInsets.all(25),

    child: Container(
    padding: EdgeInsets.all(10),

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white

    ),
    child:Stack(
      children: <Widget>[
       Padding(padding: EdgeInsets.all(20),
         child: Container(
           child: Column(
             children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Expanded(child:
                   Text("Name:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.deepOrange),)
                   ,flex: 1,)

                   ,
                   Expanded(child:
                   Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),)
                   ,flex: 2,)
                 ],
               ),
               Divider(
                 color: Colors.deepOrange,
                 height: 25,
               ),
               Row(
                 children: <Widget>[
                   Expanded(child:
                   Text("Mobile:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.deepOrange),),flex: 1,)
                   ,
                   Expanded(child:
                   Text(mobile,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),flex: 2,)
                 ],
               ),
               Divider(
                 color: Colors.deepOrange,
                 height: 25,
               ),
               Row(
                 children: <Widget>[
                   Expanded(child:
                   Text("Add :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.deepOrange),),flex: 1,)
                   ,
                   Expanded(child:
                   Text(add,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),flex: 2,)
                 ],
               ),
               Divider(
                 height: 100,
                 color: Colors.deepOrange,
               ),
               Padding(padding: EdgeInsets.only(top: 30)),
               Row(
                 children: <Widget>[
                   Expanded(child:
                   RaisedButton(onPressed: (){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>myprofile1(getdata())));
                   },color: Colors.red,shape: StadiumBorder(),child:
                     Text("Change details",style: TextStyle(fontSize: 20,color: Colors.white),),))  ,

                 ],
               ),
               Row(
                 children: <Widget>[
                   Expanded(child:
                   RaisedButton(onPressed: (){

                   },color: Colors.red,shape: StadiumBorder(),child:


                       Text(" Payment  ₹",style: TextStyle(fontSize: 22,color: Colors.white),),

                   ),)

                 ],
               )

             ],

           ),
         ),
       )
      ],
    )
      ,)));
  }




}
