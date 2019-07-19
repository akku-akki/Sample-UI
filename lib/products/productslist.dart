import 'package:flutter/material.dart';
//import 'package:flutter_counter/flutter_counter.dart';
import 'package:foods1/cartdetails/cart.dart';
import 'package:foods1/cartdetails/cart_model.dart';
import 'package:foods1/help/notes.dart';
//import 'package:foods1/help/database_helper.dart';
import 'package:foods1/sembast_helper.dart';
import 'package:foods1/crudsop.dart';
class products_list extends StatefulWidget {
  @override
  _products_listState createState() => _products_listState();
}

class _products_listState extends State<products_list> {
  //DatabaseHelper helper = DatabaseHelper();

  var list = [
    {
      "name":"vanila",
      "Price": "60",
    },
    {
      "name":"mango",
      "Price": "60",
    },
    {
      "name":"strawberry",
      "Price": "60",
    },
    {
      "name":"butter scotch",
      "Price": "70",
    },
    {
      "name":"kesar pista",
      "Price": "70",
    },
    {
      "name":"chocolate",
      "Price": "70",
    },
    {
      "name":"cassatta",
      "Price": "80",
    },
  ];
  @override
  Widget build(BuildContext context) {
   var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return  Container(
      height: mheight,
       width: mwidth,
      child: Scaffold(
        appBar: AppBar(title: Text('RRH',style: TextStyle(fontSize: 25,color: Colors.black),)
            ,actions: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>cartlist()));

              },color: Colors.white,)

            ],
        backgroundColor: Colors.orange,),
        body: Column(
          children: <Widget>[
            Expanded(
              child: build3(context),
            )
          ],
        ) ,
      ),
    );
  }
  @override
  Widget build3(BuildContext context){
    return ListView.builder(
      
    itemCount: list.length
        ,itemBuilder: (BuildContext context,int index){
      return productlist(
        name1: list[index]['name'],
        price1:list[index]['Price'],
      );
      
    });
  }
}

class productlist extends StatefulWidget{
 String name1;
 String price1;
 productlist({this.name1,this.price1});
 @override
  _productlistState createState() => _productlistState(name1, price1);
}
class _productlistState extends State<productlist> {
  var name1;
  var price1;
  _productlistState(this.name1,this.price1);
  var _defaultvalue= 0;
 // DatabaseHelper helper = DatabaseHelper();
 //AppDatabase ab =AppDatabase();
 Operation opp = new Operation();
 Notes notes; 

  @override
  Widget build (BuildContext context){
     
    return Card(
      child: Hero(
        tag: name1,
        child: Material(
          child: ListTile(
            title: Text(name1,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange,fontSize: 20),),
             subtitle: Column(
               children: <Widget>[
                 Padding(padding: const EdgeInsets.all(0.0),
                 child: Text(" ${price1}",style: TextStyle(fontSize: 20,color: Colors.black),),),
                 Row(
                   children: <Widget>[
                     IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){
                       notes.name = name1;notes.price=price1;notes.counter =_defaultvalue;
                      // Notes(name1, price1, _defaultvalue);
                   _updatethelist() ;
                     })
                   ],
                 )
               ],
             ),

            trailing: Column(
              children: <Widget>[

                IconButton(icon: Icon(Icons.arrow_drop_up,size: 40,color: Colors.orange,), onPressed: (){setState(() {
                  _defaultvalue = _defaultvalue+1;
                  _updatethelist();
                });}),
                Text(_defaultvalue.toString(), style: TextStyle(fontSize: 12),),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: IconButton(icon: Icon(Icons.arrow_drop_down,size: 40,color: Colors.orange,), onPressed: (){

                   setState(() {
                     _defaultvalue = _defaultvalue-1;
                     _updatethelist();
                   });
                  }),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  void _updatethelist() async{
   // int result;
    if (notes.id != null){
      await opp.update(notes);
      print('updated');
    }else{
       await opp.insert(notes);
       print('inserted');
    }

  }
}



  