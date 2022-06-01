import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
//  final Color color;
  final int index;
  final String url;
  final double width;
  static const String name='';
  static const String price='';

  const PageViewItem({
    Key? key,
//    required this.color,

    required this.index,
    required this.width,
    required this.url,
//    required this.name,
//    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(index),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,

          width: width,
        ),
      ),
    );
  }
}


