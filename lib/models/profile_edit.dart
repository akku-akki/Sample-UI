import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foods1/models/profile.dart';


class myprofile1 extends StatefulWidget {
  var getdata;
  myprofile1(this.getdata);
  @override
  _myprofileState1 createState() => _myprofileState1();
}

class _myprofileState1 extends State<myprofile1> {
  var name;
  var mobile;
  var add;
  final Formkey = GlobalKey<FormState>();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _mobilecontroller = TextEditingController();
  TextEditingController _addcontroller = TextEditingController();

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
              Padding(padding: EdgeInsets.all(1),
                child: Container(
                  alignment:  Alignment.topRight,
                  child: Form(
                  key: Formkey,child:
                  SingleChildScrollView(
                    child: Column(
children: <Widget>[
  Padding(padding: EdgeInsets.all(10)
    ,child: Material(
      elevation: 0.0,
      color: Colors.white.withOpacity(0.8),
      borderRadius: BorderRadius.circular(15),
      child: Padding(padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: "Name",
              hintText: "Your name",
              icon: Icon(Icons.person,color: Colors.deepOrange,size: 28,)
          ),
          keyboardType: TextInputType.text,
          controller: _namecontroller,
          validator: (value){
            if (value.isEmpty){
              return "please enter your name";

            }else{return null;}
          },
          onSaved: (String value){
            name = value;
          },
        ),),

    ),),
  Padding(padding: EdgeInsets.all(10)
    ,child: Material(
      elevation: 0.0,
      color: Colors.white.withOpacity(0.8),
      borderRadius: BorderRadius.circular(15),
      child: Padding(padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: "Mobile",
              hintText: "Your number",
              icon: Icon(Icons.smartphone,color: Colors.deepOrange,size: 28,)
          ),
          keyboardType: TextInputType.number,
          controller: _mobilecontroller,
          validator: (value){
            if (value.isEmpty){
              return "Your Number ";

            }else{return null;}
          },
          onSaved: (String value){
            mobile = value;
          },
        ),),

    ),),
  Padding(padding: EdgeInsets.all(10)
    ,child: Material(
      elevation: 0.0,
      color: Colors.white.withOpacity(0.8),
      borderRadius: BorderRadius.circular(15),
      child: Padding(padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: "Add.",
              hintText: "Your Address",
              icon: Icon(Icons.directions_walk,color: Colors.deepOrange,size: 28,)
          ),
          keyboardType: TextInputType.text,
          controller: _addcontroller,
          validator: (value){
            if (value.isEmpty){
              return "Your valid Address?? ";

            }else{return null;}
          },
          onSaved: (String value){
            add = value;
          },
        ),),

    ),),

  Padding(padding: EdgeInsets.only(top: 35),child: Material(
    elevation: 0.0,
    color: Colors.deepOrange,
    borderRadius: BorderRadius.circular(15.0),
    child: MaterialButton(onPressed: (){
      if (Formkey.currentState.validate()){
        Formkey.currentState.save();
      }else{
        return null;
      }
      setState(() {
        create_name(name);
        create_mobile(mobile);
        create_add(add);

      });
      setState(() {
        widget.getdata;
      });

     Fluttertoast.showToast(msg: "Details Saved",
     gravity: ToastGravity.CENTER,
     fontSize: 25,
     backgroundColor: Colors.orange,
     textColor: Colors.white,
      timeInSecForIos: 1,
     toastLength: Toast.LENGTH_LONG);
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>select()));
    //  create_user(Number);
    },
      minWidth: MediaQuery.of(context).size.width-100,
      child: Text("Save",textAlign: TextAlign.center,style: TextStyle(
          fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
      ),),
    ),
  ),),



    ]),
                  )),


                ),
              )
            ],
          )
          ,)));
  }

  void create_name(name) async{
  final prefs =await SharedPreferences.getInstance();
  prefs.setString("Name", name);
  }
  void create_mobile(mobile) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Mobile", mobile);
  }
  void create_add(add)async {
   final prefs = await SharedPreferences.getInstance();
   prefs.setString("Add", add);
  }

  void moveToLastScreen() {

  }
}