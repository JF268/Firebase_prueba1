import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference = FirebaseFirestore.instance.collection('tasks');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){
            tasksReference.get().then((value){
              //QuerySnapshot collection = value;
              //List<QueryDocumentSnapshot> docs = collection.docs;
              //QueryDocumentSnapshot doc = docs[0];
              //print(doc.data());
              QuerySnapshot collection = value;
              collection.docs.forEach((QueryDocumentSnapshot element) {
                Map<String, dynamic> myMap = element.data() as Map<String,dynamic>;
                print(myMap["title"]); });
            });
          }, 
          child: Text("Obtener la data")),
          ElevatedButton(onPressed: (){
            tasksReference.add({
              "title": "Ir a recoger los documentos",
              "description": "postular a trabajo",
            }).then((DocumentReference value){
              print(value); 
            });
           
          }, 
          child: Text("Agregar documento")),
          ElevatedButton(onPressed: (){
            tasksReference.doc("oLsRKh0cQ2NIGJZQ5NXu").update(
            {
              "title": "Ir de compras al mall",
            },
            ).catchError((error){
              print(error);
            }).whenComplete(() => (){
              print("Actualización terminada");
            });
          }, 
          child: Text("Actualizar document")),
          ElevatedButton(onPressed: (){
            tasksReference.doc("m6KZgFpMpQPewJajPEwi").delete().catchError((error){
              print(error);
            }).whenComplete(() => (){
              print("La eliminación del documento");
            });
          }, 
          child: Text("Eliminar documento")),
          //documentos personalizados
          ElevatedButton(onPressed: (){
            tasksReference.doc("A00001").set({
              "title" : "Ir al dentista",
              "description": "curar diente",
            }).catchError((error){
              print(error);
            }).whenComplete(() => (){
              print("Creación completada");
            });
          }, child: Text("Agregar tarea personalizado"))

        ],),
      ),
    );
  }
}

