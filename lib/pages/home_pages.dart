import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tareas/ui/general/colors.dart';
import 'package:tareas/ui/widgets/general_widgets.dart';
import '../ui/widgets/textfield_widget_search.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference = FirebaseFirestore.instance.collection('tasks');
/*
  Stream<int> counter() async*{
    for(int i=0;i<10;i++){
      yield i;
      await Future.delayed(const Duration(seconds: 2));
    }
  }
  Future<int> getNumber() async{
    return 1000;
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F6FF),
      floatingActionButton: InkWell(
        onTap: (){

        },
        borderRadius: BorderRadius.circular(14.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:10,vertical: 8),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: kBrandPrymaryColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add, color: Colors.white,),
              Text("Nueva tarea", style: TextStyle(
                color: Colors.white,
                fontSize: 18.0),),
        ],) ),
      ),
      body: SingleChildScrollView(
        child: Column( 
          children: [
            Container( 
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
              width: double.infinity,
              decoration: BoxDecoration( 
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(18.0),
                  bottomLeft: Radius.circular(18.0),
                ),
                boxShadow: [
                  BoxShadow( 
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(4, 4),
                  )
                ],
               ),
              
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenido",style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2c3550),
                     ),),
                    divider6(),
                    Text("Mis tareas", style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2c3550),
                     ),),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow( 
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 12,
                              offset: const Offset(4, 4),
                              ),
                            ], 
                          ),
                      child: TextFieldSearchWidget(),
                    ),
                  ]),
              ),
            ),
            divider10(),
            Padding(padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Todas mis tareas", style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600,
            color: kBrandPrymaryColor),),
            Container( 
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.white,
              boxShadow: [BoxShadow( 
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(4, 4),
                blurRadius: 12.0
              )]),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.5),
                    decoration: BoxDecoration(
                      color: Color(0xff3E80FF),
                      borderRadius: BorderRadius.circular(6.0)),
                    child: Text("Personal", style: TextStyle(color: Colors.white,
                    fontSize: 13.0)),
                  ),
                    divider3(),
                  Text("Lorem ipsum dolor sit asset",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrymaryColor.withOpacity(0.85)),),
                    divider6(),                  
                  Text("lorem ipsun wele dolo inpery san bvold dlain flat wen tusk pro adr lasusre",style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: kBrandPrymaryColor.withOpacity(0.75))),
                    divider6(),
                  Text("10/12/2022",style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: kBrandPrymaryColor.withOpacity(0.75))),
                ],
              ),
            )
            ]),)
          ],
        ),
        
        )
      /*
      StreamBuilder(
        stream: tasksReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){
            QuerySnapshot collection = snap.data;
            List<QueryDocumentSnapshot> docs = collection.docs;
            List<Map<String, dynamic>> docsMap = docs.map((e)=> e.data() as Map<String,dynamic>).toList();
            print(docsMap);
            return ListView.builder(
              itemCount: docsMap.length,
              itemBuilder:(BuildContext context, int index){
                return ListTile( 
                  title: Text(docsMap[index]["title"]),
                );
              }
              );
          }
          return Center(child: CircularProgressIndicator(),);
        }
      )/*
      */
      StreamBuilder(stream: counter() ,
      builder: (BuildContext context, AsyncSnapshot snap){
        if(snap.hasData){
          QuerySnapshot collection = snap.data;
        }
        return Center(child: CircularProgressIndicator(),);
      },

      /* llamando a la instrucción de stream
      StreamBuilder(stream: counter() ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          int data = snapshot.data;
          return Center(child: Text(data.toString(),),);
        }
        return Center(child: CircularProgressIndicator(),);
      },*/
      )
      */
    );
  }
}

