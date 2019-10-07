import 'package:flutter/material.dart';
import './items.dart';

class ItemControl extends StatelessWidget {
  final Function addItem;
  final myController = TextEditingController();
  ItemControl(this.addItem);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        showDialog<Null>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('Add Item to your ToDo Application'),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: [
                    TextFormField(
                      controller: myController,
                      decoration: InputDecoration(labelText: 'Item name', prefixIcon: Padding(
                        padding: const EdgeInsets.only( top: 15, left: 0, right: 0, bottom: 5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.pink,
                        ),),),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the Item name.';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                RaisedButton(
                  child: new Text('ADD',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    addItem(Item(myController.text));
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  child: new Text('CANCEL',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text('Add Item',style: TextStyle(color: Colors.white),),
      color: Theme.of(context).primaryColor,
    );
  }
}
