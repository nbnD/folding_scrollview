import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
//  final Color color;
  final int index;
  final String url;
  final double width;
  
  const PageViewItem({
    Key? key,

    required this.index,
    required this.width,
    required this.url,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,

          width: width,
        ),
     
    );
  }
}


