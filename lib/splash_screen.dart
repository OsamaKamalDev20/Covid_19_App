import 'dart:async';
import 'dart:math' as math;
import 'package:covid19_app/colors/app_colors.dart';
import 'package:covid19_app/screens/covid_19_onboarding_screen.dart';
// import 'package:covid19_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Covid19SplashScreen extends StatefulWidget {
  const Covid19SplashScreen({super.key});

  @override
  State<Covid19SplashScreen> createState() => _Covid19SplashScreenState();
}

class _Covid19SplashScreenState extends State<Covid19SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => Covid19OnBoardingScreen()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                width: 200.0,
                height: 200.0,
                child: const Center(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/virus.png"),
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Covid-19\nTracker App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
