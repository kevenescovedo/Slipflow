import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slipflow/main.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:slipflow/shared/theme/textstyles.dart';

bool status = false;
DateTime dateSelected = DateTime.now();

class NotificationWidget extends StatefulWidget {
  bool status;
  Function(bool value) onToggle;
  NotificationWidget({Key? key, required this.status, required this.onToggle})
      : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  DateTime datenow = DateTime.now();
  String text = 'Agende uma notificação';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16, left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.bell,
                  color: AppColors.colorPrimary,
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 1,
                  height: 48,
                  color: AppColors.colorStroke,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Ativar notificações",
                  style: AppTextStyles.fontinputstyle,
                )
                /*  TextButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(
                              datenow.year,
                              datenow.month,
                              datenow.day,
                              datenow.hour,
                              datenow.minute), onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                        text =
                            "${date.day}/ ${date.month}/${date.year} ${date.hour} : ${date.minute}";
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, locale: LocaleType.pt);
                    },
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.blue),
                    )), 
                    */
              ],
            ),
            FlutterSwitch(
                activeColor: Colors.greenAccent,
                inactiveColor: Colors.grey,
                width: 100.0,
                height: 50.0,
                valueFontSize: 25.0,
                toggleSize: 45.0,
                value: widget.status,
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: widget.onToggle),
          ],
        ));
  }
}
