import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReorderableGridItem extends StatefulWidget {
  final Widget? child;
  final GlobalObjectKey<FormState> myKey;
  final double widthFlex;
  final bool allowDrag;
  int? orderNumber;

  setOrderNumber(int newOrderNumber) {
    this.orderNumber ??= newOrderNumber;
  }

  ReorderableGridItem({
    this.child,
    this.widthFlex = 0.5,
    required this.myKey,
    this.orderNumber,
    this.allowDrag = true,
  });

  ReorderableGridItem copyWith({
    Widget? child,
    GlobalObjectKey<FormState>? myKey,
    double? widthFlex,
    bool? allowDrag,
    int? orderNumber,
  }) {
    return ReorderableGridItem(
      child: child ?? this.child,
      myKey: myKey ?? this.myKey,
      orderNumber: orderNumber ?? this.orderNumber,
      widthFlex: widthFlex ?? this.widthFlex,
      allowDrag: allowDrag ?? this.allowDrag,
    );
  }

  @override
  _ReorderableGridItemState createState() => _ReorderableGridItemState();
}

class _ReorderableGridItemState extends State<ReorderableGridItem> {
  late double _screenWidth;
  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      key: widget.myKey,
      width: _screenWidth * widget.widthFlex,
      // height: (_screenWidth * widget.widthFlex) * 1.6,
      child: Material(
        color: Colors.transparent,
        child: widget.child,
      ),
    );
  }
}
