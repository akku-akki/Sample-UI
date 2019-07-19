class Notes{
  int _id;
  String _name;
  var _price;
  int _counter;

  Notes(String _name,int _price,int _counter){
this._name = _name;
this._price =_price;
this._counter = _counter;
  }
  
  Notes.withId(this._id,this._name,this._price,this._counter);


 int get id => _id;
set id (int newid){
  this._id = newid;
}


    String get name => _name;
  int get price => _price;
  int get counter => _counter;

  set name (String newName){
    this._name = newName;
  }
  set price (int newPrice){
    this._price = newPrice;
  }
  set counter (int newCounter){
    this._counter = newCounter;
  }

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
   if (id !=null)
    {

      map['id'] = _id;
    }
    map['name'] = _name;
    map['price'] = _price;
    map['counter'] = _counter;
    return map;
  }
  Notes.fromMapObjects(Map<String,dynamic> map){
    this._id = map['id'];
    this._name =map['name'];
    this._price = map['price'];
    this._counter = map['counter'];
  }

}