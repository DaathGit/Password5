import 'package:flutter/material.dart';
import 'package:password/data/custom_text_styles.dart';
import 'package:password/widgets/complete_dialog.dart';
import 'package:password/widgets/rotated_text.dart';

import 'data/app_strings.dart';
import 'widgets/password_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> password = [0, 0, 0, 0, 0];
  bool canChangeValue = true;
  String secretKey = const String.fromEnvironment("secretCode");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const Positioned(
            bottom: 100, right: 30,
            child: RotatedText(angle: 0.2, text: AppStrings.hint1, style: CustomTextStyles.black30,),
          ),
          const Positioned(
            bottom: 60, left: 50,
            child: RotatedText(angle: -0.4, text: AppStrings.hint2, style: CustomTextStyles.black20,),
          ),
          const Positioned(
            top: 40, right: 20,
            child: RotatedText(angle: 0.4, text: AppStrings.hint3, style: CustomTextStyles.black30,),
          ),
          const Positioned(
            top: 140, left: 20,
            child: Text(AppStrings.hint5, style: CustomTextStyles.black20,),
          ),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ for (int i = 0; i < password.length; i++) ...[PasswordBox(i: i, password: password, changePasswordValue: changePasswordValue,)], ],
          ),),
        ],),
      ),
    );
  }




  /// --------------------------------------------------------------------------
  ///   FUNZIONI
  /// --------------------------------------------------------------------------
  /// Cambio valore password
  void changePasswordValue(int i) {
    if (!canChangeValue) return;
    setState(() => password[i] = nextDigit(password[i]));
    if (checkPassword()) {
      setState(() => canChangeValue = false);
      showDialog(context: context, barrierDismissible: false, builder: (context) => const CompleteDialog(),);
    }
  }

  /// Prossimo numero valore password
  int nextDigit(int digit) => digit = digit < 9 ? digit + 1 : 0;

  bool checkPassword() {
    List<int> correctPassword = secretKey.split("").map((String digit) => int.parse(digit)).toList();
    for (int i = 0; i < password.length; i++) {
      if (correctPassword[i] != password[i]) return false;
    }
    return true;
  }
}
