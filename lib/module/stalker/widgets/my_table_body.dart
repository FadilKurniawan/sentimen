import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sentimen/data/base/base_file_controller.dart';
import 'package:sentimen/module/stalker/widgets/my_table_cell.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:sentimen/themes/theme_services.dart';
import 'package:url_launcher/url_launcher.dart';

class MyTableBody extends StatefulWidget {
  final BaseFileController baseController;
  final List<List<String>> listData;
  final ScrollController bodyController;

  MyTableBody({
    required this.baseController,
    required this.listData,
    required this.bodyController,
  });

  @override
  _MyTableBodyState createState() => _MyTableBodyState();
}

class _MyTableBodyState extends State<MyTableBody> {
  LinkedScrollControllerGroup _controllers2 = LinkedScrollControllerGroup();
  ScrollController? firstColumnController;
  ScrollController? secondColumnController;
  ScrollController? restColumnController;
  @override
  void initState() {
    firstColumnController = _controllers2.addAndGet();
    secondColumnController = _controllers2.addAndGet();
    restColumnController = _controllers2.addAndGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0 || notification.depth == 1;
      },
      onRefresh: () async {
        await Future.delayed(
          Duration(seconds: 2),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: widget.baseController.getWidthCell(0),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                controller: firstColumnController,
                physics: ClampingScrollPhysics(),
                children: List.generate(
                    widget.listData.isNotEmpty ? widget.listData.length : 0,
                    (index) {
                  return widget.listData.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(
                              color: ThemeService().isDarkMode()
                                  ? Resources.color.scaffoldDarkColor
                                  : Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: ThemeService().isDarkMode()
                                      ? Resources.color.shadowDarkColor
                                      : Resources.color.shadowColor,
                                  offset: Offset(0.0, 1.5),
                                  blurRadius: 4,
                                  spreadRadius: 0.0,
                                )
                              ]),
                          margin: EdgeInsets.only(
                              top: 12,
                              left: 6,
                              bottom:
                                  index == widget.listData.length - 1 ? 70 : 0),
                          child: MyTableCell(
                            // color:
                            //     Resources.color.colorPaleGrey.withOpacity(0.2),
                            value: widget.listData[index][0],
                            cellWidth: widget.baseController.getWidthCell(0),
                          ),
                        )
                      : Container();
                }),
              ),
            ),
          ),
          SizedBox(
            width: widget.baseController.getWidthCell(1),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                controller: secondColumnController,
                physics: ClampingScrollPhysics(),
                children: List.generate(
                    widget.listData.isNotEmpty ? widget.listData.length : 0,
                    (index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 12,
                        bottom: index == widget.listData.length - 1 ? 70 : 0),
                    decoration: BoxDecoration(
                        color: ThemeService().isDarkMode()
                            ? Resources.color.scaffoldDarkColor
                            : Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: ThemeService().isDarkMode()
                                ? Resources.color.shadowDarkColor
                                : Resources.color.shadowColor,
                            offset: Offset(0.0, 1.5),
                            blurRadius: 4,
                            spreadRadius: 0.0,
                          )
                        ]),
                    child: MyTableCell(
                      // color: Resources.color.colorPaleGrey.withOpacity(0.2),
                      // value: widget.listData[index + 1][1],
                      cellWidth: widget.baseController.getWidthCell(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 26,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            decoration: ShapeDecoration(
                              color: Resources.color.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              widget.listData[index][1],
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Resources.color.textColorWhite
                                    .withOpacity(0.8),
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.bodyController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: widget.baseController.getWidthBody(
                  widget.listData.isNotEmpty
                      ? widget.listData[0].length - 1
                      : 0,
                ),
                child: ListView(
                  controller: restColumnController,
                  physics: ClampingScrollPhysics(),
                  children: List.generate(
                      widget.listData.isNotEmpty ? widget.listData.length : 0,
                      (y) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 12,
                          right: 6,
                          bottom: y == widget.listData.length - 1 ? 70 : 0),
                      decoration: BoxDecoration(
                          color: ThemeService().isDarkMode()
                              ? Resources.color.scaffoldDarkColor
                              : Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: ThemeService().isDarkMode()
                                  ? Resources.color.shadowDarkColor
                                  : Resources.color.shadowColor,
                              offset: Offset(0.0, 1.5),
                              blurRadius: 4,
                              spreadRadius: 0.0,
                            )
                          ]),
                      child: InkWell(
                        onTap: () {},
                        // hoverColor:
                        //     Resources.color.colorPaleGrey.withOpacity(0.2),
                        child: Container(
                          child: Row(
                            children: List.generate(
                                (widget.listData.isNotEmpty
                                    ? widget.listData[0].length - 2
                                    : 0), (x) {
                              return MyTableCell(
                                value: widget.listData[(y)][(x + 2)],
                                cellWidth:
                                    widget.baseController.getWidthCell(x + 2),
                                child: getWidgetChild(
                                    widget.listData[(y)][(x + 2)], x + 2),
                              );
                            }),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? getWidgetChild(String str, int i) {
    switch (i) {
      case 2:
        return InkWell(
          onTap: () async {
            if (await canLaunch(str)) {
              await launch(str);
            } else {
              widget.baseController.error('link not valid');
            }
          },
          child: Container(
            height: 35,
            alignment: Alignment.center,
            // padding: EdgeInsets.only(left: 12, right: 8, top: 2, bottom: 8),
            decoration: ShapeDecoration(
              color: getColor(str),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: FaIcon(
              getIcon(str),
              color: Resources.color.white,
              size: 18,
            ),
          ),
        );
      case 7:
        return InkWell(
          onTap: () async {
            if (str.isNotEmpty && await canLaunch(str)) {
              await launch(str);
            } else {
              widget.baseController.error('link not valid');
            }
          },
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: ThemeService().isDarkMode()
                  ? Resources.color.formDarkColor
                  : Resources.color.colorSilver.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            padding: EdgeInsets.all(6),
            child: str.isEmpty
                ? Icon(
                    FontAwesomeIcons.questionCircle,
                    color: Resources.color.colorSilver,
                    size: 20,
                  )
                : Image(
                    image: Resources.images.googleDrive,
                    fit: BoxFit.fitHeight,
                  ),
          ),
        );
      default:
        return null;
    }
  }

  Color getColor(String str) {
    if (str.contains('https://twitter.com/')) {
      return Resources.color.twitter;
    } else if (str.contains('https://www.youtube.com/')) {
      return Resources.color.youtube;
    } else if (str.contains('https://www.instagram.com/')) {
      return Resources.color.instagram;
    } else if (str.contains('https://www.facebook.com/')) {
      return Resources.color.facebook;
    } else if (str.contains('https://www.tiktok.com/')) {
      return Resources.color.tiktok;
    } else {
      return Resources.color.web;
    }
  }

  IconData getIcon(String str) {
    if (str.contains('https://twitter.com/')) {
      return FontAwesomeIcons.twitter;
    } else if (str.contains('https://www.youtube.com/')) {
      return FontAwesomeIcons.youtube;
    } else if (str.contains('https://www.instagram.com/')) {
      return FontAwesomeIcons.instagram;
    } else if (str.contains('https://www.facebook.com/')) {
      return FontAwesomeIcons.facebook;
    } else if (str.contains('https://www.tiktok.com/')) {
      return FontAwesomeIcons.tiktok;
    } else {
      return FontAwesomeIcons.internetExplorer;
    }
  }
}
