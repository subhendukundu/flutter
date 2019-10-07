import './item_control.dart';
import 'package:flutter/material.dart';
import './items.dart';

class ItemManager extends StatefulWidget {
  final String startingItem;
  ItemManager(this.startingItem) {
    print('[ItemManager] Constructor');
  }
  @override
  State<StatefulWidget> createState() {
    print('[ItemManager] createState()');
    return _ItemManagerState();
  }
}

class _ItemManagerState extends State<ItemManager> {
  List<Item> _items = [];

  @override
  void initState() {
    print('[ItemManager State] initState()');
    super.initState();
    _items.add(Item(widget.startingItem));
  }

  @override
  void didUpdateWidget(ItemManager oldWidget) {
    print('[ItemManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _updateItems(Item item) {
    print('abbbbbb');
    setState(() {
      _items.add(item);
    });
  }

  void _updateState(Item item, bool value) {
    setState(() {
      item.status = value;
    });
  }

  void _deleteItem(Item it){
    setState(() {
     _items.remove(it);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ItemManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: Items(_items, _updateState,_deleteItem),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: ItemControl(_updateItems),
        ),
      ],
    );
  }
}
