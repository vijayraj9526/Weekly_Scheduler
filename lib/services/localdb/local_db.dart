// import 'package:isar/isar.dart';
// import 'package:scheduler_app/services/models/schedule_datamodel.dart';

// class LocalDBServices {
// late Future<Isar> db;

// LocalDBServices(){
//   db=openDB();
// }


//   Future<Isar> openDB()async{
//     if(Isar.instanceNames.isEmpty){
//       return await Isar.open([SchedueModelSchema],inspector: true);
//     }

//     return Future.value(Isar.getInstance());
//   }


//   Future<void> saveSchedule({required SchedueModel schedule})async{
//   final isar=await db;
//   isar.writeTxnSync(() => isar.schedueModels.putSync(schedule));
  
//   }
// } 