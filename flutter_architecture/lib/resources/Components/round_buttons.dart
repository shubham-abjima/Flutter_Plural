import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/Colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(fontSize: 20, color: AppColors.whitecolor),
                  )),
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
