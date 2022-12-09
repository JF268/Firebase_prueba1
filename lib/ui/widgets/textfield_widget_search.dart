import 'package:flutter/material.dart';


class TextFieldSearchWidget extends StatelessWidget {
  const TextFieldSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField( 
                        decoration: InputDecoration( 
                          prefixIcon: Icon(Icons.search,size: 20.0,),
                          hintText: "Buscar tarea...",
                          hintStyle: TextStyle(fontSize:14.0,color: Color(0xff2C3550).withOpacity(0.6)),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(14.0),
                           borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(14.0),
                           borderSide: BorderSide.none),
      ),
    );
  }
}

