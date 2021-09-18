import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sentimen/data/storage/validator.dart';
import 'package:sentimen/data/widgets/forms/forms_dropdown_controller.dart';
import 'package:sentimen/model/db_model.dart';
import 'package:sentimen/resources/resources.dart';

class DropdownWidgets extends StatelessWidget {
  DropdownWidgets(
      {Key? key,
      required this.selectedItem,
      required this.onChanged,
      required this.listString,
      this.isExpanded = true,
      this.width,
      this.icon,
      this.decoration,
      this.name,
      this.alignment = Alignment.centerLeft})
      : super(key: key);
  final double? width;
  final Rx<StringId> selectedItem;
  final List<StringId> listString;
  final void Function(String? val)? onChanged;
  // final void Function(int? val)? onSaved;
  final bool isExpanded;
  final Icon? icon;
  final Decoration? decoration;
  final Alignment alignment;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Container(
          child: FormDropdownController<String>(
            initialValue: selectedItem.value.value,
            decoration: InputDecoration(
                prefixIcon: icon,
                contentPadding:
                    EdgeInsets.only(right: 12, left: icon == null ? 12 : 0)),
            valueController: selectedItem.value.value,
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: Resources.color.colorPrimary,
              size: 30,
            ),
            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            autofocus: true,
            iconSize: 24,
            elevation: 16,
            isExpanded: isExpanded,
            style: TextStyle(color: Resources.color.textColor),
            validator: FormBuilderValidator.required(context),
            valueTransformer: (value) => value.toString(),
            onChanged: onChanged,
            items: listString
                .map((gender) => DropdownMenuItem(
                      value: gender.value,
                      child: Text('${gender.value}'),
                    ))
                .toList(),
            name: name ?? '',
          ),
        ),
      ),
    );
  }
}
