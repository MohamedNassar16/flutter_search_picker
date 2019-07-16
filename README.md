# flutter_search_picker
Search picker which shows a list, gives the ability to search and return the selected item.

## Getting started

add

search_picker: ^1.0.0+1

to your pubspec.yaml file under your dependencies.


## Usage:

You can call the search picker and pass A list of strings , Title & A callback function which returns the selected item and index .

SearchPickerView( List<String>.generate(5, (i) => "$i"), "Select Number", _CallBackFunction,),)
  
   void setItemDate(String _selectedItem, int _index) {
    areaSelectedName = _selectedItem;
    index = _index;
  }
  
Customize your picker by adding optional parameters for icon & color.
  
  
 
