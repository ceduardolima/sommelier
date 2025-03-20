import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sommelier/routing/routes.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';
import 'package:sommelier/ui/core/static/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: _AnimatedSplashImage(
                onEnd: () {
                  setState(() {
                    _showProgressIndicator = true;
                    Future.delayed(Duration(seconds: 1), () {
                      if (context.mounted) {
                        context.go(Routes.onBoarding);
                      }
                    });
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: _showProgressIndicator,
                replacement: SizedBox(height: 32),
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedSplashImage extends StatefulWidget {
  const _AnimatedSplashImage({required this.onEnd});
  final void Function() onEnd;

  @override
  State<_AnimatedSplashImage> createState() => _AnimatedSplashImageState();
}

class _AnimatedSplashImageState extends State<_AnimatedSplashImage> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    _startDelayedAnimation();
  }

  void _startDelayedAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        Durations.long4,
        () => setState(() {
          _startAnimation = true;
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const imageHeigh = 150;
    const imageWidth = 226;
    const double animationHeight = imageHeigh + 100.0;

    final width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: animationHeight,
      width: width,
      child: Stack(
        children: [
          AnimatedPositioned(
            width: imageWidth.toDouble(),
            height: animationHeight,
            top: _startAnimation ? 20 : animationHeight,
            left: (width - imageWidth) / 2,
            curve: Curves.easeOutBack,
            duration: Duration(seconds: 1),
            onEnd: widget.onEnd,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.splashImagePath,
                  cacheHeight: imageHeigh,
                  cacheWidth: imageWidth,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 2),
                  child: Text(
                    AppLocalization.of(context).get("appSplashTitle"),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                      height: 0.9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
