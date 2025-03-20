import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/static/assets.dart';
import 'package:sommelier/ui/core/ui/widgets/bottom_sheet_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                Assets.drinkWineImagePath,
                cacheWidth: 226,
                cacheHeight: 186,
              ),
            ),
            BottomSheetContainer(child: SizedBox(height: 440)),
          ],
        ),
      ),
    );
  }
}
