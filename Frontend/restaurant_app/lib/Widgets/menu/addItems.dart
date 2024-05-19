import 'package:flutter/material.dart';
import 'package:restaurant_app/Widgets/buttons/cancelButton.dart';
import 'package:restaurant_app/Widgets/constants/texts.dart';
import 'package:restaurant_app/Widgets/menu/menuItem.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            'Add Item or Category',
            style: h5TextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          MenuItem(
            itemName: 'Add Dish',
          ),
          SizedBox(
            height: 20,
          ),
          MenuItem(
            itemName: 'Add Category',
          ),
          SizedBox(
            height: 20,
          ),
          MenuItem(
            itemName: 'Add Sub-Category',
          ),
          SizedBox(
            height: 20,
          ),
          Align(alignment: Alignment.centerRight, child: CancelButton()),
        ],
      ),
    );
    ;
  }
}
