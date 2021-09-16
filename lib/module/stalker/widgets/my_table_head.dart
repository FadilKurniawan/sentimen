import 'package:flutter/material.dart';
import 'package:sentimen/model/db_model.dart';
import 'package:sentimen/module/stalker/stalker_page_controller.dart';

import 'my_table_cell.dart';

class MyTableHead extends StatelessWidget {
  final ScrollController scrollController;
  final double height;
  final List<StringId> listChild;
  final StalkerPageController baseController;
  MyTableHead({
    required this.scrollController,
    this.height = 50,
    required this.listChild,
    required this.baseController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          MyTableCell(
            // color: Resources.color.colorPaleGrey,
            value: listChild[0].value,
            cellWidth: baseController.getWidthCell(0),
            isHeader: true,
          ),
          MyTableCell(
            // color: Resources.color.colorPaleGrey,
            value: listChild[1].value,
            cellWidth: baseController.getWidthCell(1),
            isHeader: true,
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(listChild.length - 2, (index) {
                return MyTableCell(
                  // color: Resources.color.colorPaleGrey,
                  value: listChild[index + 2].value,
                  cellWidth: baseController.getWidthCell(index + 2),
                  isHeader: true,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
