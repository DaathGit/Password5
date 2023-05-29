import 'package:flutter/material.dart';
import 'package:password/data/custom_text_styles.dart';

class PasswordBox extends StatelessWidget {
  static const Map<int, String> passwordDigits = {1: "I", 2: "II", 3: "III", 4: "IV", 5: "V"};

  final int i;
  final List<int> password;
  final Function changePasswordValue;

  const PasswordBox({Key? key, required this.i, required this.password, required this.changePasswordValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / password.length * 0.8;
    return GestureDetector(
      onTap: () => changePasswordValue(i),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(passwordDigits[i+1] ?? "", style: CustomTextStyles.black20.copyWith(color: i == 3 ? Colors.red : Colors.black, fontWeight: i == 3 ? FontWeight.bold : FontWeight.normal,),),
        Container(
          width: width, height: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5,),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(password[i].toString(), style: CustomTextStyles.black60,),
          ),
        ),
      ],),
    );
  }
}
