import 'package:flutter/material.dart';
import 'package:tareas/ui/widgets/general_widgets.dart';
import 'package:tareas/ui/widgets/item_category.dart';

import '../general/colors.dart';

class ItemTaskWidget extends StatelessWidget {
  const ItemTaskWidget({super.key});

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
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemCategoryWidget(text: "Trabajo",
                  
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
            );
  }
}