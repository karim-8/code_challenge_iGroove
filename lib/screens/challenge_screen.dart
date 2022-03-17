import 'package:flutter/material.dart';
import 'animation_widget_screen.dart';
import '../reorderable_grid_view/reorderable_grid_item.dart';
import '../reorderable_grid_view/reorderable_grid_view.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key, this.scrollUpdateTrigger}) : super(key: key);
  final Function(ScrollController?)? scrollUpdateTrigger;
  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  ScrollController? _scrollController;
  List<int?>? savedOrder;
  void _initScrollController() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (widget.scrollUpdateTrigger != null) {
          widget.scrollUpdateTrigger!(_scrollController);
        }
      });
  }

  @override
  void initState() {
    super.initState();
    _initScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableGridView(
      scrollController: _scrollController,
      orderedIndexes: savedOrder,
      onOrderChange: (newOrderedList) {
        savedOrder = newOrderedList.map((e) => e!.orderNumber).toList();
      },
      children: [
        ReorderableGridItem(
          widthFlex: 1,
          myKey: GlobalObjectKey<FormState>(1),
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.red),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Wrap(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed "
                                "diam nonumy eirmod tempor invidunt ut labore et dolore magna "
                                "aliquyam erat, sed diam voluptua. At vero eos et accusam et "
                                "justo duo dolores et ea rebum. Stet clita kasd gubergren, no "
                                "sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem "
                                "ipsum dolor sit amet, consetetur sadipscing elitr, sed diam "
                                "nonumy eirmod tempor invidunt ut labore et dolore magna "
                                "aliquyam erat, sed diam voluptua. At vero eos et accusam et "
                                "justo duo dolores et ea rebum. Stet clita kasd gubergren, no "
                                "sea takimata sanctus est Lorem ipsum dolor sit amet.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          allowDrag: true,
        ),
        ReorderableGridItem(
          widthFlex: 1,
          myKey: GlobalObjectKey<FormState>(2),
          child: HomeScreen(),
          allowDrag: true,
        ),
        ReorderableGridItem(
          widthFlex: 1,
          myKey: GlobalObjectKey<FormState>(3),
          child: Container(
            height: 75,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
          allowDrag: true,
        ),
        ReorderableGridItem(
          widthFlex: 1,
          myKey: GlobalObjectKey<FormState>(4),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const Center(
              child: Text(
                "Info: With a longPress on the boxes you can reorder them to "
                    "different positions.",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, height: 18 / 14),
              ),
            ),
          ),
          allowDrag: false,
        ),
      ],
    );
  }
}
