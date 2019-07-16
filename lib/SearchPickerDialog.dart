import 'package:flutter/material.dart';

class SearchPickerDialog extends StatelessWidget {

  List<String> dataToBind;
  Function _callBackFunction;
  Color color;

  SearchPickerDialog(this.dataToBind, this._callBackFunction,[this.color = Colors.white]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MySreachPicker(
          dataToBind,
          _callBackFunction,
          color
      ),
    );
  }
}

class MySreachPicker extends StatefulWidget {
  List<String> dataToBind;
  Function _callBackFunction;
  Color color;
  final String title;

  MySreachPicker(this.dataToBind, this._callBackFunction,this.color, {Key key, this.title})
      : super(key: key);


  @override
  _MySreachPickerState createState() =>
      _MySreachPickerState(dataToBind, _callBackFunction,color);
}

class _MySreachPickerState extends State<MySreachPicker> {
  var allItems = List<String>();
  var filteredItems = List<String>();
  static String selectedValue = null;
  Function _callBackFunction;
  Color color;

  _MySreachPickerState(this.allItems, this._callBackFunction,this.color) {
    filteredItems = allItems;
  }

  @override
  Widget build(BuildContext context) {
    var SearchText = TextField(
      onChanged: (value) {
        changeFilteredItems(value);
      },
      decoration: InputDecoration(
        labelText: "Search",
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
      ),
    );

    var listOfItems = Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ListTile(
              title: Text('${filteredItems[index]}',style: TextStyle(color: color),),
            ),
            onTap: () {
              _callBackFunction(filteredItems[index]);
              selectedValue = filteredItems[index];
              // Scaffold.of(context)
              //     .showSnackBar(SnackBar(content: Text(filteredItems[index])));
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
    return Padding(
      padding: EdgeInsets.all(10),
      child: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[SearchText, listOfItems],
            ),
          )),
    );
  }

  void changeFilteredItems(String value) {
    setState(() {
      filteredItems = allItems
          .where((s) => s.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  showSelected(BuildContext context, int index) {
    setState(() {
      selectedValue = filteredItems[index];
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(filteredItems[index])));
    });
  }
}
