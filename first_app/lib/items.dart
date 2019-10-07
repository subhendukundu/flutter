import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final List<Item> items;
  final Function updateState;
  final Function deleteItem;
  Items(this.items, this.updateState, this.deleteItem) {
    print('[Item Widget] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[Item Widget] build');
    return Column(
      children:
          items.map((element) => checkBox(element, element.status)).toList(),
    );
  }

  Widget checkBox(Item item, bool val) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(
            value: val,
            onChanged: (bool value) {
              updateState(item, value);
            },
          ),
          Text(
            item.name,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              decoration: _markup(item),
            ),
          ),
          FlatButton(
            child: Icon(Icons.delete),
            onPressed: () {
              deleteItem(item);
            },
          )
        ],
      ),
    );
  }

  TextDecoration _markup(Item it) {
    if (it.status == true) {
      return TextDecoration.lineThrough;
    }
    return null;
  }
}

class Item {
  String name;
  bool status;
  Item(String name) {
    this.name = name;
    this.status = false;
  }
}
