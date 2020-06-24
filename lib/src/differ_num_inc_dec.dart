import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:number_inc_dec/number_inc_dec.dart';

/// A definition for the callback function.
/// This is the expected function definition for the callbacks after increment and decrement.
/// The callback will be passed the new value.
/// The same can be read as a string from [NumberInputWithIncrementDecrement.controller].
typedef void DiffIncDecCallBack(num newValue);

class NumberInputPrefabbed extends NumberInputWithIncrementDecrement {
  /// Provide a custom controller.
  final TextEditingController controller;

  /// Decides the button placement using [ButtonArrangement].
  /// Defaults to [ButtonArrangement.rightEnd]
  final ButtonArrangement buttonArrangement;

  /// Minimum value allowed for this field. Defaults to zero.
  final num min;

  /// Maximum value allowed for this field. Defaults to `double.infinity`.
  final num max;

  /// A factor by which the numeric value should be incremented or decremented.
  /// e.g. Setting `incDecFactor=0.5` increments or decrement the number field by 0.5.
  /// Defaults to 1.
  final num incDecFactor;

  /// Initial value for the number input field. Defaults to zero.
  final num initialValue;

  /// Decideds if the field only accepts integer values.
  /// Defaults to true.
  final bool isInt;

  /// Decoration for the TextFormField.
  /// Defaults to a simple outline border.
  final InputDecoration numberFieldDecoration;

  /// Decoration for the whole widget.
  /// defaults to a simple container with rounded border.
  final Decoration widgetContainerDecoration;

  /// validators for this field.
  /// Defaults to [_NumberInputWithIncrementDecrementState._minMaxValidator] validator
  /// based on the values of [min] and [max] field.
  /// Note: These values default to [0] and [double.infinity] respectively.
  ///
  /// ```dart
  /// String _minMaxValidator(String value) {
  ///    return num.parse(value) < widget.min || num.parse(value) > widget.max
  ///        ? 'Value should be between ${widget.min} and ${widget.max}'
  ///        : null;
  ///  }
  /// ```
  final FormFieldValidator<String> validator;

  /// Decoration for the Increment Icon
  /// Defaults to a black border in the bottom.
  final Decoration incIconDecoration;

  /// Decoration for the Decrement Icon
  /// Defaults to null;
  final Decoration decIconDecoration;

  /// Icon to be used for Incrment button.
  final IconData incIcon;

  /// Icon size to be used for Incrment button.
  /// Defaults to size defined in IconTheme
  final double incIconSize;

  /// Icon color to be used for Incrment button.
  /// Defaults to color defined in IconTheme
  final Color incIconColor;

  /// A call back function to be called on succesful increment.
  /// This will not called if the internal validators fail.
  /// It of type  [DiffIncDecCallBack].
  final DiffIncDecCallBack onIncrement;

  /// Icon to be used for Decrement button.
  final IconData decIcon;

  /// Icon size to be used for Decrment button.
  /// Defaults to size defined in IconTheme
  final double decIconSize;

  /// Icon color to be used for Decrement button.
  /// Defaults to color defined in IconTheme
  final Color decIconColor;

  /// A call back function to be called on succesful decrement.
  /// This will not called if the internal validators fail.
  /// It of type  [DiffIncDecCallBack].
  final DiffIncDecCallBack onDecrement;

  /// No of digits after decimal point.
  /// Defaults to value of 2 for non int fields.
  /// Should be between 0 and 20 inclusively.
  final int fractionDigits;

  /// A scaling factor for the whole widget.
  /// Defaults to 1.
  final double scaleWidth;

  /// A scaling factor for the whole widget.
  /// Defualts to 1.
  final double scaleHeight;

  /// Show a separator between the increment & decrement buttons.
  /// Defaults to false.
  final bool separateIcons;

  NumberInputPrefabbed.containerLessButtons({
    @required this.controller,
    this.buttonArrangement = ButtonArrangement.rightEnd,
    this.min = -2,
    this.max = double.infinity,
    this.initialValue = 0,
    this.incDecFactor = 1,
    this.isInt = true,
    this.numberFieldDecoration,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.validator,
    this.incIcon = Icons.arrow_drop_up,
    this.decIcon = Icons.arrow_drop_down,
    this.fractionDigits = 2,
    this.scaleWidth = 1.0,
    this.scaleHeight = 1.0,
    this.incIconSize = 28,
    this.decIconSize = 28,
    this.decIconColor,
    this.incIconColor,
    this.onDecrement,
    this.onIncrement,
    this.separateIcons = false,
  })  : incIconDecoration = BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        decIconDecoration = BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        );

  NumberInputPrefabbed.leafyButtons({
    @required this.controller,
    this.buttonArrangement = ButtonArrangement.rightEnd,
    this.min = 0,
    this.max = double.infinity,
    this.initialValue = 0,
    this.incDecFactor = 1,
    this.isInt = true,
    this.numberFieldDecoration,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.validator,
    this.incIcon = Icons.arrow_drop_up,
    this.decIcon = Icons.arrow_drop_down,
    this.fractionDigits = 2,
    this.scaleWidth = 1.0,
    this.scaleHeight = 1.0,
    this.incIconSize = 28,
    this.decIconSize = 28,
    this.decIconColor,
    this.incIconColor,
    this.onDecrement,
    this.onIncrement,
    this.separateIcons = true,
    Color incDecBgColor = Colors.green,
  })  : incIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: buttonArrangement == ButtonArrangement.rightEnd
              ? BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        ),
        decIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: buttonArrangement == ButtonArrangement.rightEnd
              ? BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        );

  NumberInputPrefabbed.directionalButtons({
    @required this.controller,
    this.buttonArrangement = ButtonArrangement.rightEnd,
    this.min = 0,
    this.max = double.infinity,
    this.initialValue = 0,
    this.incDecFactor = 1,
    this.isInt = true,
    this.numberFieldDecoration,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.validator,
    this.incIcon = Icons.arrow_drop_up,
    this.decIcon = Icons.arrow_drop_down,
    this.fractionDigits = 2,
    this.scaleWidth = 1.0,
    this.scaleHeight = 1.0,
    this.incIconSize = 28,
    this.decIconSize = 28,
    this.decIconColor,
    this.incIconColor,
    this.onDecrement,
    this.onIncrement,
    this.separateIcons = true,
    Color incDecBgColor = Colors.green,
  })  : incIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        ),
        decIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        );

  NumberInputPrefabbed.roundedEdgeButtons({
    @required this.controller,
    this.buttonArrangement = ButtonArrangement.incRightDecLeft,
    this.min = 0,
    this.max = double.infinity,
    this.initialValue = 0,
    this.incDecFactor = 1,
    this.isInt = true,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.validator,
    this.incIcon = Icons.arrow_drop_up,
    this.decIcon = Icons.arrow_drop_down,
    this.fractionDigits = 2,
    this.scaleWidth = 1.0,
    this.scaleHeight = 1.0,
    this.incIconSize = 27,
    this.decIconSize = 27,
    this.decIconColor,
    this.incIconColor,
    this.onDecrement,
    this.onIncrement,
    this.separateIcons = true,
    Color incDecBgColor = Colors.lightGreen,
  })  : numberFieldDecoration = buttonArrangement ==
                    ButtonArrangement.rightEnd ||
                buttonArrangement == ButtonArrangement.leftEnd
            ? InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: buttonArrangement == ButtonArrangement.rightEnd
                      ? BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                ),
              )
            : null,
        incIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: buttonArrangement == ButtonArrangement.rightEnd
              ? BorderRadius.only(
                  topRight: Radius.circular(5),
                )
              : buttonArrangement == ButtonArrangement.incLeftDecRight
                  ? BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    )
                  : buttonArrangement == ButtonArrangement.incRightDecLeft
                      ? BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        ),
        decIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: buttonArrangement == ButtonArrangement.rightEnd
              ? BorderRadius.only(
                  bottomRight: Radius.circular(5),
                )
              : buttonArrangement == ButtonArrangement.incLeftDecRight
                  ? BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    )
                  : buttonArrangement == ButtonArrangement.incRightDecLeft
                      ? BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        )
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                        ),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        );
  NumberInputPrefabbed.roundedButtons({
    @required this.controller,
    this.buttonArrangement = ButtonArrangement.rightEnd,
    this.min = 0,
    this.max = double.infinity,
    this.initialValue = 0,
    this.incDecFactor = 1,
    this.isInt = true,
    this.widgetContainerDecoration = const BoxDecoration(),
    this.validator,
    this.incIcon = Icons.add,
    this.decIcon = Icons.remove,
    this.fractionDigits = 2,
    this.scaleWidth = 1.0,
    this.scaleHeight = 1.0,
    this.incIconSize = 27,
    this.decIconSize = 27,
    this.decIconColor,
    this.incIconColor,
    this.onDecrement,
    this.onIncrement,
    this.separateIcons = true,
    this.numberFieldDecoration,
    Color incDecBgColor = Colors.lightGreen,
  })  : incIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        ),
        decIconDecoration = BoxDecoration(
          color: incDecBgColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
            color: Colors.black,
            width: 0.25,
          ),
        );
}

enum ButtonArrangement {
  /// Places both the buttons to the left of the text field.
  leftEnd,

  /// Places both the buttons to the right of the text field.
  rightEnd,

  /// Places increment button to the left and decrement button to the right.
  incLeftDecRight,

  /// Places increment button to the right and decrement button to the left.
  incRightDecLeft,
}

class NumberInputWithIncrementDecrement extends StatefulWidget {
  /// Provide a custom controller.
  final TextEditingController controller;

  /// Decides the button placement using [ButtonArrangement].
  /// Defaults to [ButtonArrangement.rightEnd]
  final ButtonArrangement buttonArrangement;

  /// Minimum value allowed for this field. Defaults to zero.
  final num min;

  /// Maximum value allowed for this field. Defaults to `double.infinity`.
  final num max;

  /// A factor by which the numeric value should be incremented or decremented.
  /// e.g. Setting `incDecFactor=0.5` increments or decrement the number field by 0.5.
  /// Defaults to 1.
  final num incDecFactor;

  /// Initial value for the number input field. Defaults to zero.
  final num initialValue;

  /// Decideds if the field only accepts integer values.
  /// Defaults to true.
  final bool isInt;

  /// Decoration for the TextFormField.
  /// Defaults to a simple outline border.
  final InputDecoration numberFieldDecoration;

  /// Decoration for the whole widget.
  /// defaults to a simple container with rounded border.
  final Decoration widgetContainerDecoration;

  /// validators for this field.
  /// Defaults to [_NumberInputWithIncrementDecrementState._minMaxValidator] validator
  /// based on the values of [min] and [max] field.
  /// Note: These values default to [0] and [double.infinity] respectively.
  ///
  /// ```dart
  /// String _minMaxValidator(String value) {
  ///    return num.parse(value) < widget.min || num.parse(value) > widget.max
  ///        ? 'Value should be between ${widget.min} and ${widget.max}'
  ///        : null;
  ///  }
  /// ```
  final FormFieldValidator<String> validator;

  /// Decoration for the Increment Icon
  /// Defaults to a black border in the bottom.
  final Decoration incIconDecoration;

  /// Decoration for the Decrement Icon
  /// Defaults to null;
  final Decoration decIconDecoration;

  /// Icon to be used for Incrment button.
  final IconData incIcon;

  /// Icon size to be used for Incrment button.
  /// Defaults to size defined in IconTheme
  final double incIconSize;

  /// Icon color to be used for Incrment button.
  /// Defaults to color defined in IconTheme
  final Color incIconColor;

  /// A call back function to be called on succesful increment.
  /// This will not called if the internal validators fail.
  /// It of type  [DiffIncDecCallBack].
  final DiffIncDecCallBack onIncrement;

  /// Icon to be used for Decrement button.
  final IconData decIcon;

  /// Icon size to be used for Decrment button.
  /// Defaults to size defined in IconTheme
  final double decIconSize;

  /// Icon color to be used for Decrement button.
  /// Defaults to color defined in IconTheme
  final Color decIconColor;

  /// A call back function to be called on succesful decrement.
  /// This will not called if the internal validators fail.
  /// It of type  [DiffIncDecCallBack].
  final DiffIncDecCallBack onDecrement;

  /// No of digits after decimal point.
  /// Defaults to value of 2 for non int fields.
  /// Should be between 0 and 20 inclusively.
  final int fractionDigits;

  /// A scaling factor for the whole widget.
  /// Defaults to 1.
  final double scaleWidth;

  /// A scaling factor for the whole widget.
  /// Defualts to 1.
  final double scaleHeight;

  /// Show a separator between the increment & decrement buttons.
  /// Defaults to false.
  final bool separateIcons;

  final Color incDecBgColor;
  NumberInputWithIncrementDecrement({
    @required this.controller,
    this.buttonArrangement = ButtonArrangement.rightEnd,
    this.min = 0,
    this.max = double.infinity,
    this.initialValue = 0,
    this.incDecFactor = 1,
    this.isInt = true,
    this.numberFieldDecoration,
    this.widgetContainerDecoration,
    this.validator,
    this.incIcon = Icons.arrow_drop_up,
    this.decIcon = Icons.arrow_drop_down,
    this.fractionDigits = 2,
    this.scaleWidth = 1.0,
    this.scaleHeight = 1.0,
    this.incIconSize,
    this.decIconSize,
    this.decIconColor,
    this.incIconColor,
    this.onDecrement,
    this.onIncrement,
    this.separateIcons = false,
    this.decIconDecoration,
    this.incIconDecoration,
    this.incDecBgColor,
  });

  @override
  _NumberInputWithIncrementDecrementState createState() => _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState extends State<NumberInputWithIncrementDecrement> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    //  Setting the initial value for the field.
    _controller.text = widget.isInt
        ? widget.initialValue.toString()
        : widget.initialValue.toStringAsFixed(widget.fractionDigits);
  }

  String _minMaxValidator(String value) {
    return value != null &&
            value.isNotEmpty &&
            (num.parse(value) < widget.min || num.parse(value) > widget.max)
        ? 'Value should be between ${widget.min} and ${widget.max}'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform:
          Matrix4.diagonal3Values(widget.scaleWidth, widget.scaleHeight, 1.0),
      child: Container(
        decoration: widget.widgetContainerDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.blueGrey,
                width: 2.0,
              ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (widget.buttonArrangement == ButtonArrangement.incLeftDecRight)
              _buildIncrementButton(),
            if (widget.buttonArrangement == ButtonArrangement.incRightDecLeft)
              _buildDecrementButton(),
            if (widget.buttonArrangement == ButtonArrangement.leftEnd)
              _buildColumnOfButtons(),
            Expanded(
              flex: 1,
              child: TextFormField(
                validator: widget.validator ?? _minMaxValidator,
                textAlign: TextAlign.center,
                autovalidate: true,
                decoration: widget.numberFieldDecoration ??
                    InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: !widget.isInt,
                  signed: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  widget.isInt
                      ? WhitelistingTextInputFormatter.digitsOnly
                      : WhitelistingTextInputFormatter(
                          RegExp("[0-9.]"),
                        )
                ],
              ),
            ),
            if (widget.buttonArrangement == ButtonArrangement.incLeftDecRight)
              _buildDecrementButton(),
            if (widget.buttonArrangement == ButtonArrangement.incRightDecLeft)
              _buildIncrementButton(),
            if (widget.buttonArrangement == ButtonArrangement.rightEnd)
              _buildColumnOfButtons(),
          ],
        ),
      ),
    );
  }

  Column _buildColumnOfButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIncrementButton(),
        if (widget.separateIcons)
          Container(
            color: Colors.transparent,
            height: 2,
          ),
        _buildDecrementButton(),
      ],
    );
  }

  Ink _buildDecrementButton() {
    return Ink(
      decoration: widget.decIconDecoration ??
          BoxDecoration(
            border: widget.buttonArrangement == ButtonArrangement.leftEnd ||
                    widget.buttonArrangement == ButtonArrangement.rightEnd
                ? null
                : Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  ),
          ),
      child: InkWell(
        splashColor: widget.incDecBgColor,
        child: Icon(
          widget.decIcon,
          size: widget.decIconSize,
          color: widget.decIconColor,
        ),
        onTap: () {
          var currentValue = widget.isInt
              ? int.parse(_controller.text)
              : double.parse(_controller.text);
          setState(() {
            currentValue = currentValue - widget.incDecFactor;
            currentValue =
                currentValue > widget.min ? currentValue : widget.min;
            _controller.text = widget.isInt
                ? currentValue.toString()
                : currentValue.toStringAsFixed(
                    widget.fractionDigits); // decrementing value
            // decrement callback
            if (widget.onDecrement != null) {
              widget.onDecrement(currentValue);
            }
          });
        },
      ),
    );
  }

  Ink _buildIncrementButton() {
    return Ink(
      decoration: widget.incIconDecoration ??
          BoxDecoration(
            border: widget.buttonArrangement == ButtonArrangement.leftEnd ||
                    widget.buttonArrangement == ButtonArrangement.rightEnd
                ? Border(
                    bottom: BorderSide(color: Colors.black),
                  )
                : Border(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  ),
          ),
      child: InkWell(
        splashColor: widget.incDecBgColor,
        child: Icon(
          widget.incIcon,
          size: widget.incIconSize,
          color: widget.incIconColor,
        ),
        onTap: () {
          var currentValue = widget.isInt
              ? int.parse(_controller.text)
              : double.parse(_controller.text);
          setState(() {
            currentValue = currentValue + widget.incDecFactor;
            currentValue =
                currentValue < widget.max ? currentValue : widget.max;
            _controller.text = widget.isInt
                ? currentValue.toString()
                : currentValue.toStringAsFixed(
                    widget.fractionDigits); // incrementing value
            // increment call back.
            if (widget.onIncrement != null) {
              widget.onIncrement(currentValue);
            }
          });
        },
      ),
    );
  }
}