import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'page_view_item.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 

  /// The current page of the page view
   double _page = 0;

  /// The index of the leftmost element of the list to be displayed
  int get _firstItemIndex => _page.toInt();

  

  /// Controller to get the current position of the page view
  final _controller = PageController(
    viewportFraction: 0.5,
  );

  /// The width of a single item
  late final _itemWidth =
      MediaQuery.of(context).size.width * _controller.viewportFraction;

@override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {
          _page = _controller.page!;
        }));
  }
   @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LV Scroll"),
      
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: _itemWidth,
                  child: FractionallySizedBox(

                    child: PageViewItem(
                      index: _firstItemIndex,
                      width: _itemWidth,
                      url: model[_firstItemIndex],

                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: PageView.builder(
                padEnds: false,
                controller: _controller,
                itemBuilder: (context, index) {
                  return Opacity(
                    opacity: index <= _firstItemIndex ? 0 : 1,
                    child: PageViewItem(
                      index: index,

                      width: _itemWidth,
                      url: model[index],

                    ),
                  );
                },
                itemCount: model.length,
              ),
            ),
          ],
    ),
        ],
      ),
    );
  }
}