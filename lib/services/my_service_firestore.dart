import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tareas/models/task_model.dart';

class MyServiceFirestore{
  
  String collection;
  MyServiceFirestore({required this.collection});
  
  late final CollectionReference _collectionReference = FirebaseFirestore.instance.collection(collection);
  
  
  //añadir

  Future<String> addTask(TaskModel model) async{
   DocumentReference documentReference = await _collectionReference.add(model.toJson());
   String id = documentReference.id;
   return id;
  }

  //borrar


  //update


}