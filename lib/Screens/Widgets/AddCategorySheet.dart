import 'package:flutter/material.dart';
void AddCategoryBottomSheet(BuildContext context){
  showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context, builder:(_){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
        ),
      ),
      height: 600,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
          )
        ],
      ),
    );
  });
}