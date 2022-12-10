import 'package:flutter/material.dart';
import 'package:tareas/ui/general/colors.dart';
import 'package:tareas/ui/widgets/button_normal-widget.dart';
import 'package:tareas/ui/widgets/general_widgets.dart';
import 'package:tareas/ui/widgets/textfield_normal_widget.dart';


class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {

  showSelectDate() async{
    DateTime? datetime = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime(2030),
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      helpText: "Seleccione fecha para la tarea",
      builder: (BuildContext context, Widget? widget){
        return Theme(
        data: ThemeData.dark().copyWith( 
          dialogTheme: DialogTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
          ),
        ), 
        child: widget!,);
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0))
          ), 
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [ 
              Text("Agregar tarea",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0),),
              divider10(),
              TextFieldNormalWidget(
                hintText: "Titulo",
                icon: Icons.text_fields,
              ),
              divider6(),
              TextFieldNormalWidget(
                hintText: "Descripción",
                icon: Icons.description,
              ),
              divider3(),
              Text("Categoría"),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                spacing: 10.0,
                children: [
                  FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                selectedColor: categoryColor["Personal"],
                checkmarkColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                labelStyle: TextStyle(color: Colors.white),
                label: Text("Personal"), 
                onSelected: (bool value){
              }),
               FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                selectedColor: categoryColor["Trabajo"],
                checkmarkColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                labelStyle: TextStyle(color: Colors.white),
                label: Text("Trabajo"), 
                onSelected: (bool value){
              }),
               FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                selectedColor: categoryColor["Otro"],
                checkmarkColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                labelStyle: TextStyle(color: Colors.white),
                label: Text("Otro"), 
                onSelected: (bool value){
              }),
                ],
              ),
              divider10(),
              TextFieldNormalWidget(hintText: "Fecha", icon: Icons.date_range,
              onTap: (){
                showSelectDate();
                
              },),
              
              ButtonNormalWidget(),
            ],
          )
        );
  }
}