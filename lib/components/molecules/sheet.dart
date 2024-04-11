import 'package:flutter/material.dart';

Future sheet(BuildContext context, Widget widget, double? height) {
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
    barrierColor: Colors.black38,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    context: context,
    builder: (context) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: height ?? MediaQuery.of(context).size.height * 0.9,
          child: widget);
    },
  );
}
