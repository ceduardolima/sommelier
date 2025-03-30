import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sommelier/ui/core/static/assets.dart';
import 'package:sommelier/ui/core/themes/dimens.dart';
import 'package:sommelier/ui/core/ui/widgets/FlatButton.dart';
import 'package:sommelier/ui/core/ui/widgets/bottom_sheet_container.dart';
import 'package:sommelier/ui/login/widgets/login_form.dart';
import 'package:sommelier/ui/login/widgets/login_switcher.dart';
import 'package:sommelier/ui/login/widgets/profile_image_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: Dimens.paddingVertical),
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
                _LoginBottomSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginBottomSheet extends StatefulWidget {
  const _LoginBottomSheet({super.key});

  @override
  State<_LoginBottomSheet> createState() => __LoginBottomSheetState();
}

class __LoginBottomSheetState extends State<_LoginBottomSheet> {
  late PageController _pageController;
  final _duration = Duration(milliseconds: 200);
  final _curve = Curves.easeInOutCubic;
  final _log = Logger("LoginBottomSheet");

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      padding: Dimens.of(context).edgeInsetsScreenSymmetric,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Dimens.paddingVertical,
        children: [
          LoginSwitcher(onChange: _changePage),
          SizedBox(
            height: 350,
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                LoginForm(
                  onSubmit: (value) {
                    _log.info(value);
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: Dimens.paddingVertical,
                  children: [ProfileImageButton(onPressed: () {})],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changePage(bool isLogin) {
    if (isLogin) {
      _previousPage();
    } else {
      _nextPage();
    }
  }

  void _nextPage() {
    _pageController.nextPage(duration: _duration, curve: _curve);
  }

  void _previousPage() {
    _pageController.previousPage(duration: _duration, curve: _curve);
  }
}
