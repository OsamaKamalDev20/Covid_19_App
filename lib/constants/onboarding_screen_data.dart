class OnBoardingScreen {
  String lottieAnimation;
  String title;
  String description;

  OnBoardingScreen(
      {required this.lottieAnimation,
      required this.title,
      required this.description});
}

List<OnBoardingScreen> contents = [
  OnBoardingScreen(
    lottieAnimation: "assets/images/lottie_animation_1.json",
    title: "Protect Yourself",
    description: "Learn how to protect yourself from the spread of COVID-19.",
  ),
  OnBoardingScreen(
    lottieAnimation: "assets/images/lottie_animation_2.json",
    title: "Stay Safe",
    description: "Get tips and advice on how to stay safe during the pandemic.",
  ),
  OnBoardingScreen(
    lottieAnimation: "assets/images/lottie_animation_3.json",
    title: "Stay Informed",
    description: "Get the latest COVID-19 updates and news.",
  ),
  OnBoardingScreen(
    lottieAnimation: "assets/images/lottie_animation_4.json",
    title: "Get Tested",
    description: "Find nearby testing centers and get tested for COVID-19.",
  ),
];
