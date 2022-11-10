import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../const/app_colors.dart';
import '../styles/styles.dart';

class User_From extends StatelessWidget {
  const User_From({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _addressController = TextEditingController();

    Rx<TextEditingController> _dateofbirthController =
        TextEditingController().obs;

    Rx<DateTime> selectedDate = DateTime.now().obs;
    _selectDate(BuildContext context) async {
      final selected = await showDatePicker(
          context: context,
          initialDate: selectedDate.value,
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
      if (selected != null && selected != selectedDate) {
        _dateofbirthController.value.text =
            "${selected.day}-${selected.month}-${selected.year}";
      }
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 30.w,
          right: 30.w,
          top: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Tell Us More About You.",
                style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.violet),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "We will not share your information outside this application.",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.violet),
              ),
              SizedBox(
                height: 30.h,
              ),
              FormField(_nameController, TextInputType.name, 'name'),
              FormField(_phoneController, TextInputType.number, 'number'),
              FormField(_addressController, TextInputType.text, 'name'),
          Obx(() => TextFormField(
            controller: _dateofbirthController.value,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "date of birth",
              hintStyle: TextStyle(
                fontSize: 15.sp,
              ),
              suffix: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_month_rounded)),
            ),
          ),),

              SizedBox(height: 10.h,),
              ToggleSwitch(
                minWidth: 90.0,
                initialLabelIndex: 1,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['Male', 'Female'],
                //icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                activeBgColors: [[Colors.blue],[Colors.pink]],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//use of widget in Textfieled
Widget FormField(controller, inputType, hint) {
  return TextFormField(
    keyboardType: inputType,
    decoration: AppStyle().textFieldDecoration(hint),
    controller: controller,
  );
}
