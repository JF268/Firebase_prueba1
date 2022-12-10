
import 'package:flutter/material.dart';

class TaskSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){
        query = "";
      }, icon: Icon(Icons.close_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, "");
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("BuildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("Suggestions");
  }

}



