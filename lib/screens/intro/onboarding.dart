import 'package:flutter/material.dart';
import 'package:front_end/provider/shared_utility.dart';
import 'package:front_end/widgets/Onboarding/onboarding_page_view.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends ConsumerState<Onboarding> {
  final pageController = PageController(initialPage: 0);
  var _skipButtonContent = 'Skip';

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changePage(int index) {
    setState(() {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 20), curve: Curves.bounceIn);
      if (index == 2) {
        _skipButtonContent = 'Get Started';
      }
      else {
        _skipButtonContent = 'Skip';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // const width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // Positioned(child: (){})),
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
              left: 10,
              right: 10,
            ),
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                changePage(index);
              },
              children: const [
                OnboardingWidget(
                    image: 'assets/images/onboarding/Onboarding_image_1.png',
                    title: 'Easy, Fast & Trusted',
                    subTitle:
                        'Fast money transfer and guaranteed safe transactions with others'),
                OnboardingWidget(
                    image: 'assets/images/onboarding/Onboarding_image_2.png',
                    title: 'Saving your Money',
                    subTitle:
                        'Track the progress of your savings and start a habit of saving with us'),
                OnboardingWidget(
                    image: 'assets/images/onboarding/Onboarding_image_3.png',
                    title: 'Free Transactions',
                    subTitle:
                        'Provides a quality of the financial system with free money transactions without any fees'),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: SmoothPageIndicator(
              onDotClicked: changePage,
              controller: pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.black, dotHeight: 6),
            ),
          ),
          Positioned(
            bottom: 35,
            right: 30,
            child: CustomButton(
              isDisabled: false,
              onPressed: () {
                ref.watch(sharedUtilityProvider).setSeen();
                context.go('/auth');
              },
              title:
                _skipButtonContent,

            ),
          )
        ],
      ),
    );
  }
}
