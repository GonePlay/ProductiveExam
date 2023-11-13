import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/images.dart';
import '../../domain/entity/onboarding_model.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardingModel> list = [
    OnboardingModel(
      image: AppImages.onboarding1,
      title: "Easy Time Management",
      desc: "We help you stay organized and \nmanage your day",
    ),
    OnboardingModel(
      image: AppImages.onboarding2,
      title: "Track Your Expense",
      desc: "We help you organize your expenses \neasily and safely",
    )
  ];
  late PageController pageController;
  bool isFirstPage = true;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 24,top: 24),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: list.length,
                  onPageChanged: (i) {
                    isFirstPage = i == 0;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Spacer(flex: 8),
                          Image.asset(list[index].image),
                          const Spacer(flex: 4),
                          Text(list[index].title,
                            style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                          const Gap(8),
                          Text(
                            list[index].desc,
                            style:  TextStyle(fontSize: 18,color: Colors.white.withOpacity(0.5)),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(flex: 12),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !isFirstPage
                      ? GestureDetector(
                    onTap: () {
                      if (pageController.page == 1) {
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  )
                      : const SizedBox(
                    width: 24,
                  ),
                  Row(
                    children: [
                      indicator(isFirstPage),
                      const Gap(6),
                      indicator(!isFirstPage),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.page == 0) {
                        pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }else{
                        Navigator.of(context).pushNamed('/login');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      duration: const Duration(milliseconds: 500),
    );
  }
}
