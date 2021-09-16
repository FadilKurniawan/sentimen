import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormDropdownController<T> extends FormBuilderField<T> {
  final List<DropdownMenuItem<T>> items;
  final Widget? hint;
  final Widget? disabledHint;
  final VoidCallback? onTap;
  final DropdownButtonBuilder? selectedItemBuilder;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double itemHeight;
  final Color? focusColor;
  final bool autofocus;
  final Color? dropdownColor;
  final bool allowClear;
  final Widget clearIcon;

  FormDropdownController({
    Key? key,
    //From Super
    T? valueController,
    required String name,
    FormFieldValidator<T>? validator,
    T? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
    ValueTransformer<T?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<T>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    required this.items,
    this.isExpanded = true,
    this.isDense = true,
    this.elevation = 8,
    this.iconSize = 24.0,
    this.hint,
    this.style,
    this.disabledHint,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.allowClear = false,
    this.clearIcon = const Icon(Icons.close),
    this.onTap,
    this.autofocus = false,
    this.dropdownColor,
    this.focusColor,
    this.itemHeight = kMinInteractiveDimension,
    this.selectedItemBuilder,
  }) : /*: assert(allowClear == true || clearIcon != null)*/ super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          decoration: decoration,
          focusNode: focusNode,
          builder: (FormFieldState<T?> field) {
            final state = field as _FormDropdownControllerState<T>;
            // DropdownButtonFormField
            // TextFormField

            void changeValue(T? value) {
              valueController = value;
              // ignore: unnecessary_statements
              onChanged != null ? onChanged(value) : () {};
              state.requestFocus();
              state.didChange(value);
            }

            return InputDecorator(
              decoration: state.decoration.copyWith(
                floatingLabelBehavior: hint == null
                    ? decoration.floatingLabelBehavior
                    : FloatingLabelBehavior.always,
              ),
              isEmpty: state.value == null,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<T>(
                        isExpanded: isExpanded,
                        hint: hint,
                        items: items,
                        value: valueController ?? field.value,
                        style: style,
                        isDense: isDense,
                        disabledHint: field.value != null
                            ? (items
                                    .firstWhereOrNull(
                                        (val) => val.value == field.value)
                                    ?.child ??
                                Text(field.value.toString()))
                            : disabledHint,
                        elevation: elevation,
                        iconSize: iconSize,
                        icon: icon,
                        iconDisabledColor: iconDisabledColor,
                        iconEnabledColor: iconEnabledColor,
                        onChanged: (value) => changeValue(value),
                        onTap: onTap,
                        focusNode: state.effectiveFocusNode,
                        autofocus: autofocus,
                        dropdownColor: dropdownColor,
                        focusColor: focusColor,
                        itemHeight: itemHeight,
                        selectedItemBuilder: selectedItemBuilder,
                      ),
                    ),
                  ),
                  if (allowClear && state.enabled && field.value != null) ...[
                    const VerticalDivider(),
                    InkWell(
                      onTap: () => changeValue(null),
                      child: clearIcon,
                    ),
                  ]
                ],
              ),
            );
          },
        );

  @override
  _FormDropdownControllerState<T> createState() =>
      _FormDropdownControllerState<T>();
}

class _FormDropdownControllerState<T>
    extends FormBuilderFieldState<FormDropdownController<T>, T> {}
