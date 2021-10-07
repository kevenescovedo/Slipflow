import 'package:flutter/material.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';

class InputTextWidget extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? initialText;
  final String? Function(String? value)? validator;
  final TextEditingController? textEditingController;
  final void Function(String value) onchanged;

  InputTextWidget(
      {Key? key,
      required this.label,
      required this.icon,
      this.initialText,
      this.validator,
      this.textEditingController,
      required this.onchanged})
      : super(key: key);

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              onChanged: widget.onchanged,
              controller: widget.textEditingController,
              validator: widget.validator,
              initialValue: widget.initialText,
              style: AppTextStyles.fontinputstyle,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: widget.label,
                  labelStyle: AppTextStyles.fontinputstyle,
                  border: InputBorder.none,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(
                          widget.icon,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.colorStroke,
                      )
                    ],
                  )),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.colorStroke,
            )
          ],
        ));
  }
}
