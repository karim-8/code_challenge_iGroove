import 'package:code_challenge/utils/constants.dart';
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
  //MARK:- Properties

  ///
  ScrollController? _scrollController;
  ///
  List<int?>? savedOrder;

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
          myKey: GlobalKey(),
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
          myKey: GlobalKey(),
          child: AnimationWidgetScreen(),
          allowDrag: true,
        ),
        ReorderableGridItem(
          widthFlex: 1,
          myKey: GlobalKey(),
          child: Container(
            height: 75,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
          allowDrag: true,
        ),
        ReorderableGridItem(
          widthFlex: 1,
          myKey: GlobalKey(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:  Center(
              child: Text(
                Constants.info,
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

  void _initScrollController() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (widget.scrollUpdateTrigger != null) {
          widget.scrollUpdateTrigger!(_scrollController);
        }
      });
  }
}
