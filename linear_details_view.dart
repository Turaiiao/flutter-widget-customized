import 'package:flutter/material.dart';

class LinearDetailsView extends StatefulWidget {

  LinearDetailsView(
    {
      Key key,
      
      @required
      this.onPress,

      this.iconColor,
      this.margin,
      this.titleIcon,
      this.text,
      this.textColor,
      this.textPressColor,
      this.textSize,
      this.height,
      this.elevation
    }
  ): super(key: key);

  final IconData titleIcon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final Color textPressColor;
  final EdgeInsetsGeometry margin;
  final double textSize;
  final double height;
  final double elevation;

  final Function onPress;

  @override
  State<StatefulWidget> createState() {
    return LinearDetailsViewState();
  }
}

class LinearDetailsViewState extends State<LinearDetailsView> {
  bool isOnPressView = false;

  void handleTapDown(TapDownDetails tapDownDetails) => setState(() => isOnPressView = true);

  void handleTapUp(TapUpDetails tapUpDetails) => setState(() => isOnPressView = false);

  void handleTapCancel() => setState(() => isOnPressView = false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTapCancel: handleTapCancel,
      onTap: () {
        widget.onPress();
      },
      child: Container(
        height: widget.height,
        child: Material(
          color: Colors.white,
          elevation: widget.elevation,
          child: InkWell(
            onTap: () {
              if (widget.onPress != null) {
                widget.onPress();
              }
            },
            child: Container(
              margin: widget.margin,
              child: Row(
                children: <Widget>[
                  Icon(
                    widget.titleIcon, color: widget.iconColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      widget.text, style: TextStyle(
                        fontSize: widget.textSize,
                        color: isOnPressView ? widget.textPressColor : widget.textColor
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}