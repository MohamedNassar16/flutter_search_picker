import 'package:flutter/material.dart';

import 'SearchPickerDialog.dart';

class SearchPickerView extends StatefulWidget {
  var allItems = List<String>();
  Function _CallBackFunction;
  String pickerTitle ;
  Color color;
  IconData icon;

  SearchPickerView(this.allItems, this.pickerTitle, this._CallBackFunction(String _selectedItem, int _index),{this.color = Colors.white,this.icon = Icons.arrow_drop_down} );
  String selectedItem;
  int selectedIndex;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return searchPickerViewState(allItems, pickerTitle, _CallBackFunction,icon: icon,color: color);
  }
}



class searchPickerViewState extends State<SearchPickerView> {

  var allItems = List<String>();
  var filteredItems = List<String>();
  Function _CallBackFunction;
  String pickerTitle ;
  String placeHolder ;
  int selectedIndex;
  Color color;
  IconData icon;

  searchPickerViewState(this.allItems, this.pickerTitle, this._CallBackFunction,{this.color , this.icon});


  @override
  Widget build(BuildContext context) {
    return searchPickerDesign(context);
  }

  Widget searchPickerDesign(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        child: GestureDetector(
          onTap: () => previewSearchPicker(context),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text( pickerTitle +" " + ( placeHolder != null  ? placeHolder : " " ) ,style: TextStyle(color: color),),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
                  child: Icon(icon,color: color,),
                )
              ],
            ),
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.transparent,
          border: new Border(
            bottom:
            new BorderSide(color: color, style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }

  void selctedItemInSearchPicker(String value) {
    setState(() {
      selectedIndex = allItems.indexOf(value);
      placeHolder = value;
      _CallBackFunction(value, selectedIndex);
    });
  }

  void changeFilteredItems(String value) {
    setState(() {
      filteredItems = allItems
          .where((s) => s.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  previewSearchPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(36),
          child: Scaffold(
              body: SearchPickerDialog(
                  allItems,
                  selctedItemInSearchPicker,color)),
        );
      },
    );
  }
}