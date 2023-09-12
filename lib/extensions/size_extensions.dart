import 'package:flutter/material.dart';

extension SizeBox on num {
  SizedBox boxH() {
    return SizedBox(
      height: this.toDouble(),
    );
  }

  SizedBox boxW() {
    return SizedBox(
      width: this.toDouble(),
    );
  }

  Container hLine({Color color = Colors.grey}) {
    return Container(
      width: this.toDouble(),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 2,
      color: color,
    );
  }

  BorderRadius borderRadius() {
    return BorderRadius.circular(this.toDouble());
  }

  roundContainer({double? width = 12, Color? color}) {
    return Container(
      width: width ?? this.toDouble(),
      height: this.toDouble(),
      decoration: BoxDecoration(
        color:color?? Colors.white,
        borderRadius: width == null
            ? this.toDouble().borderRadius()
            : (width * 0.5).borderRadius(),
      ),
    );
  }
}
