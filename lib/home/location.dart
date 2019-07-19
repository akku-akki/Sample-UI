import 'package:flutter/material.dart';

import 'package:foods1/area/localarea.dart';
class select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Container(
      height: mheight,
      width: mwidth,
     // color: Colors.orange.withOpacity(0.3),
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
    padding: EdgeInsets.all(35),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius:
      BorderRadius.circular(25),
        color: Colors.white,
        
      ),
      child: Stack(
        children: <Widget>[

          /* Positioned(
          width: mwidth-60
          ,child: Icon(Icons.fastfood,color: Colors.deepOrange,size: 80,)),*/
             


           
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
               Icon(Icons.fastfood,color: Colors.deepOrange,size: 80,),

                 Padding(padding: EdgeInsets.only(top: 150,bottom: 20),child:
                 Card(shape: StadiumBorder(),child: Text("Select Location",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,),textAlign: TextAlign.center,),color: Colors.orangeAccent,),),

                 buttons(context,"location A"),
                 buttons(context,"location B"),
                 buttons(context,"location C"),
                 buttons(context,"location D"),
                 buttons(context,"location E"),
               ],
             )

             ,
        ],
      ),

    ),
    );
  }

  Widget buttons(BuildContext context,String location){
    return RaisedButton(color: Colors.orangeAccent ,shape: StadiumBorder(),onPressed: (){
      Navigator.push( context, MaterialPageRoute(builder: (context)=>main_items()));
    },
      child: Text( location,style: TextStyle(color: Colors.red,fontWeight: FontWeight.normal,fontSize: 20,),),);

  }


}


