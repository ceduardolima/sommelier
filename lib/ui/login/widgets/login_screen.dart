import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sommelier/ui/core/static/assets.dart';
import 'package:sommelier/ui/core/ui/widgets/bottom_sheet_container.dart';
import 'package:sommelier/ui/login/widgets/login_switcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late PageController _pageController;
  final _duration = Duration(milliseconds: 200);
  final _curve = Curves.easeInOutCubic;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

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
            BottomSheetContainer(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 30,
                children: [
                  LoginSwitcher(
                    onChange: (bool isLogin) {
                      if (isLogin) {
                        _previousPage();
                      } else {
                        _nextPage();
                      }
                    },
                  ),
                  SizedBox(
                    height: 300,
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(),
                          color: Colors.red,
                        ),
                        Container(
                          constraints: BoxConstraints.expand(),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(duration: _duration, curve: _curve);
  }

  void _previousPage() {
    _pageController.previousPage(duration: _duration, curve: _curve);
  }
}
