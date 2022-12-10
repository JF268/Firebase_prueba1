import 'package:flutter/material.dart';
import 'package:tareas/models/task_model.dart';
import 'package:tareas/ui/widgets/general_widgets.dart';
import 'package:tareas/ui/widgets/item_category.dart';

import '../general/colors.dart';

class ItemTaskWidget extends StatelessWidget {
  TaskModel taskModel;

  ItemTaskWidget({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Container( 
              padding: 
              const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.white,
              boxShadow: [BoxShadow( 
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(4, 4),
                blurRadius: 12.0
              )]),
              child: Stack(children: [
                 Column( 

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemCategoryWidget(text: taskModel.category,
                  ),
                    divider3(),
                  Text(taskModel.title,style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kBrandPrymaryColor.withOpacity(0.85)),),
                    divider6(),                  
                  Text(taskModel.description,style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: kBrandPrymaryColor.withOpacity(0.75))),
                    divider6(),
                  Text(taskModel.date,style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: kBrandPrymaryColor.withOpacity(0.75))),
                ],
              ),
                 Positioned(
                  top: -10,
                  right: -12,
                   child: PopupMenuButton(
                    elevation: 2,
                    color: Colors.white,
                    icon: Icon(Icons.more_vert, color: kBrandPrymaryColor.withOpacity(0.85),),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    ),
                    onSelected: (value) {
                      print(2);
                    },
                    itemBuilder: (BuildContext context){
                    return [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Editar")),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Finalizar")),
                    ];
                   }),
                 )
              ],)
            );
  }
}