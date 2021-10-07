import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:slipflow/shared/theme/textstyles.dart';

class DatePickerWidget extends StatefulWidget {
  String text;
  String? erro;
  Function(DateTime data) onChanged;
  Function(DateTime data) onCofirm;

  DatePickerWidget(
      {Key? key, required this.text, required this.onChanged, this.erro, required this.onCofirm})
      : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime datenow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      FontAwesomeIcons.timesCircle,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.colorStroke,
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                       theme: DatePickerTheme(backgroundColor: Colors.white),
                        showTitleActions: true,
                        minTime: DateTime(datenow.year, datenow.month,
                            datenow.day, datenow.hour, datenow.minute),
                        onChanged: widget.onChanged,
                        onConfirm: widget.onCofirm,

                        /* (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                      widget.text =
                          "${date.day}/ ${date.month}/${date.year} ${date.hour} : ${date.minute}";
                    }, onConfirm: (date) {
                      print('confirm $date');
                 
                  }, */
                        locale: LocaleType.pt);
                  },
                  child: Text(
                    widget.text,
                    style: AppTextStyles.fontinputstyle,
                  )),
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.colorStroke,
          ),
          Text(
            widget.erro ?? '',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
