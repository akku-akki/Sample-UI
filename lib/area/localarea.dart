import 'package:flutter/material.dart';
import 'package:foods1/home/location.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:foods1/products/productslist.dart';
import 'package:foods1/models/profile.dart';

class main_items extends StatefulWidget {
  @override
  _main_itemsState createState() => _main_itemsState();
}

class _main_itemsState extends State<main_items> {
  var itemlist=[
    {
      'picture':'images/salad.png',
      'name':'Salad'
    },
    {
      'picture':'images/dish.png',
      'name':'Main Course'
    },
    {
      'picture':'images/curry.png',
      'name':'Dal'
    },
    {
      'picture':'images/bread.png',
      'name':'Roti'
    },
    {
      'picture':'images/breads.png',
      'name':'Papad'
    },
    {
      'picture':'images/rice.png',
      'name':'Rice'
    },
    {
      'picture':'images/noodles.png',
      'name':'Chinese'
    },
    {
      'picture':'images/milkshakes.png',
      'name':'Refreshment'
    },
    {
      'picture':'images/milkshake.png',
      'name':'Faluda'
    },
    {
      'picture':'images/tea-pot.png',
      'name':'Beverages'
    },
    {
      'picture':'images/pancakes.png',
      'name':'Dessert'
    },
    {
      'picture':'images/malai-kulfi.png',
      'name':'Kulfi'
    },
    {
      'picture':'images/ice-cream.png',
      'name':'IceCream'
    },
    {
      'picture':'images/11..jpg',
      'name':'Idli/Dosa'
    },

  ];

@override
Widget build(BuildContext context) {
  var mheight= MediaQuery.of(context).size.height;
  var mwidth = MediaQuery.of(context).size.width;
  return Container(
    height: mheight,
    width: mwidth,
    child: Scaffold(appBar: AppBar(title:Text('Sample UI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),backgroundColor: Colors.orange,
     actions: <Widget>[
       IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed:(){})
     ],),
      backgroundColor: Colors.orangeAccent
          .withOpacity(0.3),resizeToAvoidBottomPadding: false,

    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(accountName: Text("aa"), accountEmail: Text("aa"),currentAccountPicture: CircleAvatar(
            radius: 25,backgroundColor: Colors.white,foregroundColor: Colors.orange,
          ),
            decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.3)
            ),),
          //  Divider(height: 40,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>myprofile()));
            },
            child: ListTile(
              leading: Icon(Icons.person,color: Colors.orange,size: 30,)
              ,title: Text('My Profile',style: TextStyle(fontSize: 20),),

            ),

          ),
          Divider(height: 5,color: Colors.orange,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>select()));
            },
            child: ListTile(
              leading: Icon(Icons.shopping_cart,color: Colors.orange,size: 30,)
              ,title: Text('My Cart',style: TextStyle(fontSize: 20),),

            ),
          ),
          Divider(height: 5,color: Colors.orange,),
          InkWell(
            onTap: (){
            },
            child: ListTile(
              leading: Icon(Icons.line_weight,color: Colors.orange,size: 30,)
              ,title: Text('Recent Order',style: TextStyle(fontSize: 20),),

            ),
          ),
          Divider(height: 5,color: Colors.orange,),
          InkWell(
            onTap: (){
            },
            child: ListTile(
              leading: Icon(Icons.supervised_user_circle,color: Colors.orange,size: 30,)
              ,title: Text('About us',style: TextStyle(fontSize: 20),),

            ),
          ),
          Divider(height: 5,color: Colors.orange,),
          InkWell(
            onTap: (){
            },
            child: ListTile(
              leading: Icon(Icons.message,color: Colors.orange,size: 30,)
              ,title: Text('Contact Us',style: TextStyle(fontSize: 20),),

            ),
          ),
          Divider(height: 5,color: Colors.orange,),
          InkWell(
            onTap: (){
            },
            child: ListTile(
              leading: Icon(Icons.directions_walk,color: Colors.orange,size: 30,)
              ,title: Text('Log Out',style: TextStyle(fontSize: 20),),

            ),
          ),
          Divider(height: 5,color: Colors.orange,),

        ],
      ),
    ),

body:Column(
  children: <Widget>[
   Expanded(child: build1(context)),
   
    Expanded(child: build2(context)),
  ],
)


    ),

  );


}
@override
Widget build1 (BuildContext context) {
   return new Container(
     height: 80,

    child: Carousel(

      boxFit: BoxFit.fitHeight,
      images: [
AssetImage('images/0c.jpg'),
        AssetImage('images/0x.jpg'),
        AssetImage('images/0z.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 100),
      dotSize: 2.0,
      indicatorBgPadding: 2.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ,
    ),


  );

}
  @override
  Widget build2(BuildContext context){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: itemlist.length,
        itemBuilder: (BuildContext context , int index){
      return product(
        picture1 : itemlist[index]['picture'],
        name1: itemlist[index]['name'],
      );
         });
  }
}

class product extends StatelessWidget {
  final name1;
  final picture1;


  product({
    this.name1,
    this.picture1,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: name1,
          child: Material(
            child: InkWell(
              onTap: () {
               //
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        name1,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange,fontSize: 20),
                      ),

                    ),
                  ),
                  child: Image.asset(
                    picture1,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }


}












