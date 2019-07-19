import 'package:sembast/sembast.dart';
import'package:foods1/sembast_helper.dart';
import 'dart:async';
import 'package:foods1/help/notes.dart';
class Operation{
static const String FRUIT_STORE_NAME = 'Notes';
final _fruitStore = intMapStoreFactory.store(FRUIT_STORE_NAME);
Future<Database> get _db async=>await AppDatabase.instance.database;

Future insert(Notes note) async{
  await _fruitStore.add(await _db, note.toMap());
  }
  Future update(Notes note) async{
    final finder = Finder(filter:Filter.byKey(note.id));
    await _fruitStore.update(await _db,note.toMap(),finder: finder,);
  }
  Future delete(int id) async{
    final finder = Finder(filter:Filter.byKey(id) );
    await _fruitStore.delete(await _db,
    finder: finder,);

  }
 Future <List<Notes>> getAllSortedByName() async{
   final finder =Finder(sortOrders: [SortOrder('name')]);
   final recordSnapshots = await _fruitStore.find(
     await _db,
     finder: finder,
   );
   return recordSnapshots.map((snapshot){
     final note =  Notes.fromMapObjects(snapshot.value);
   note.id = snapshot.key;  
   }).toList();
 }


}