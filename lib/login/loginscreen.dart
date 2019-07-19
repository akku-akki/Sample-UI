 import 'package:flutter/material.dart';
import 'registeration.dart';
import 'package:foods1/cartdetails/cart.dart';





class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Formkey = GlobalKey<FormState>();
  String number ="";
  String Password = "";
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
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
          child:  Stack(
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  
                  child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('images/3..jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,),
                  ),
                ),

                   Container(
                     color: Colors.white.withOpacity(0.4),
                   ),

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                       Padding(
                           padding: EdgeInsets.only(left: 0,top: 10),
                           child:Icon(Icons.fastfood,size: 80,color: Colors.deepOrange,) ),
                       
                     ],
                   ),
                Container(
                  margin: EdgeInsets.fromLTRB(20,250,20,20),
                  child: Form(
                      key: Formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            email(),
                            password(),
                            Container(
                              margin: EdgeInsets.all(25),
                            ),
                            login_button(),
                            signup_Button(),
                            InkWell(onTap: (){},
                              child: Text("Forget Password", style: TextStyle(color: Colors.red,fontSize: 20,fontWeight:FontWeight.bold ),textAlign: TextAlign.center, )
                              ,
                            )
                          ],
                        ),
                      )),

                ),


              ],
            ),
          ),
        ),



    );
  }
  Widget email() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.smartphone,color: Colors.white,size: 30,),

        labelText: 'Phone Number',
        hintText:"please enter Your's no",
      ),
      validator: checkEmpty,
      onSaved: (String value) {
        number = value;
      },
    );
  }

  Widget password() {
    return TextFormField(

      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.vpn_key,color: Colors.white,size: 35,),

        labelText: 'Password',
        hintText: 'please enter password here',
      ),

      onSaved: (String value) {
        Password = value;
      },
    );
  }

  Widget login_button() {
    return
      RaisedButton(color: Colors.orangeAccent ,shape: StadiumBorder(),onPressed: (){
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>cartlist()));
      },
        child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 25,),),);
  }

  Widget signup_Button() {
    return
      RaisedButton(color: Colors.orangeAccent ,shape: StadiumBorder(),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
      },
        child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 25,),),);
  }


 String checkEmpty(String value) {
    if (value.isEmpty||value.length<9||value.contains(".")){
      return "Please Enter Valid Number ";
    }
    return null;
  }
}