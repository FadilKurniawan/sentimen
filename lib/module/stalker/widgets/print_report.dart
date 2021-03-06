import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sentimen/data/widgets/primary_button.dart';
import 'package:sentimen/resources/resources.dart';
import 'package:intl/intl.dart';

class PrintReport extends StatelessWidget {
  final String? title;
  final String? date;
  final String? body;

  const PrintReport({
    Key? key,
    this.title,
    this.date,
    this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKeyReport = GlobalKey<FormBuilderState>();
    final scrollController = ScrollController();
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 500,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.close_rounded)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.centerLeft,
                        child: Text(title ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Resources.color.textColor,
                            )),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                          alignment: Alignment.centerLeft,
                          child: FormBuilder(
                              key: formKeyReport,
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 200,
                                    child: FormBuilderDateTimePicker(
                                      name: 'date',
                                      initialValue: DateTime.now(),
                                      alwaysUse24HourFormat: true,
                                      inputType: InputType.date,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      decoration: InputDecoration(),
                                      format: DateFormat(
                                          'EEEE, dd MMMM yyyy', 'id_ID'),
                                    ),
                                  ),
                                ],
                              ))),
                      SizedBox(height: 24),
                      Container(
                        height: 500,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  alignment: Alignment.centerLeft,
                                  child: SelectableText(body ?? '',
                                      style: TextStyle(fontSize: 12))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: PrimaryButton(
                            onPressed: () {
                              formKeyReport.currentState?.save();
                              Clipboard.setData(ClipboardData(
                                      text: ('$title \n') +
                                          ('${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(formKeyReport.currentState?.value['date'])} \n\n') +
                                          (body ?? '')))
                                  .then((value) {
                                Get.snackbar(
                                    'Copied', 'Data Copied on clipboard',
                                    icon: Icon(
                                      Icons.copy_all,
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.all(30),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.grey,
                                    colorText: Colors.white);
                              });
                            },
                            child: Text(
                              'Copy',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Resources.color.textColorWhite),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
