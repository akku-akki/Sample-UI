import 'package:flutter/material.dart';
import 'package:foods1/home/location.dart';
import 'package:shared_preferences/shared_preferences.dart';


class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  var Email;
  var Password;
  var Number;

  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _nocontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: mheight,
        width: mwidth,
        child: Stack(
          children: <Widget>[
            Image.asset('images/4..jpg'
            ,fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,),
            Container(
              color: Colors.white.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(padding: EdgeInsets.only(top: 20),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
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
                            hintText: "e.g John",
                            icon: Icon(Icons.person,color: Colors.deepOrange,)
                            ),
                            keyboardType: TextInputType.text,
                            controller: _namecontroller,
                            validator: (value){
                              if (value.isEmpty){
                                return "please enter your name";

                              }else{return null;}
                            },
                          ),),

                        ),),
                      Padding(padding: EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 0.0,
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                        child: Padding(padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "abc@example.com",
                                icon: Icon(Icons.email,color: Colors.deepOrange,)
                            ),
                            keyboardType: TextInputType.text,
                            controller: _emailcontroller,
                            validator: (value){
                              if (!value.contains("@")){
                                return "Enter Valid Email";

                              }else{return null;}
                            },
                            onSaved: (String value){
                              Email = value;
                            },
                          ),),

                      ), ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 0.0,
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                              decoration: InputDecoration(

                                  labelText: 'Phone Number',
                                  hintText: 'Phone no:',
                                  icon: Icon(Icons.phone,color: Colors.deepOrange,)),
                              keyboardType: TextInputType.number,
                              controller: _nocontroller,
                              obscureText:  true,
                              validator: (value) {
                                if (value.isEmpty||value.length<9||value.contains('.')) {
                                  return 'Enter Valid Number';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (String value) {
                                Number = value;
                                create_user(Number);
                              }
                          ),
                            ), ),),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 0.0,
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                                decoration: InputDecoration(

                                    labelText: 'Password',
                                    hintText: 'Password',
                                    icon: Icon(Icons.vpn_key,color: Colors.deepOrange,)),
                                keyboardType: TextInputType.text,
                                controller: _passwordcontroller,
                                obscureText:  true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Valid Password';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (String value) {
                                  Password = value;

                                }
                            ),
                          ), ),),
                      Padding(padding: EdgeInsets.only(top: 25),child: Material(
                        elevation: 0.0,
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15.0),
                        child: MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>select()));
                          create_user(Number);
                        },
                          minWidth: MediaQuery.of(context).size.width-20,
                          child: Text("Submit",textAlign: TextAlign.center,style: TextStyle(
                            fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),)
                    ],
                  ),
                )),
              ),
            ),)
          ],
        ),


      ),
    );
  }

  Future<bool> create_user(String no) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("no", no );
    print(no);
 return true;
   }
}
