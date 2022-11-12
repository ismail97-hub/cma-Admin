import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../resources/values_manager.dart';
import 'field_label.dart';

class CustomDropDown<T> extends StatelessWidget {
  final String label;
  final Stream<List<T>> stream;
  final bool isRequired;
  final double width;
  final T? selectedItem;
  final String Function(T?) itemAsString;
  final Function(T) onTap;
  const CustomDropDown({Key? key, 
    required this.label, 
    required this.stream, 
    bool? isRequired, 
    double? width,
    this.selectedItem, 
    required this.itemAsString, 
    required this.onTap}) 
  : this.isRequired = isRequired ??true, 
    this.width = width ?? AppSize.s250,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label,isRequired: isRequired),
          StreamBuilder<List<T>>(
            stream: stream,
            builder: (context, snapshot) {
              return DropdownSearch<T>(
                mode: Mode.MENU,
                selectedItem: selectedItem,
                items: snapshot.data,
                itemAsString: itemAsString,
                dropdownSearchDecoration: InputDecoration(hintText: label),
                onChanged: <T>(value) { 
                  onTap.call(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}