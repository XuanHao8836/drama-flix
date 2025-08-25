import 'package:drama_flix/app/core/extensions/navigator_extension.dart';
import 'package:drama_flix/common/utils/prefs_helper.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_cubit.dart';
import 'package:drama_flix/feature/login/presentation/pages/login_page.dart';
import 'package:drama_flix/feature/main/presentation/pages/main_page.dart';
import 'package:drama_flix/feature/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:drama_flix/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:drama_flix/feature/onboarding/presentation/widget/explore_page.dart';
import 'package:drama_flix/feature/onboarding/presentation/widget/find_page.dart';
import 'package:drama_flix/feature/onboarding/presentation/widget/subscribe_page.dart';
import 'package:drama_flix/feature/onboarding/presentation/widget/trending_page.dart';
import 'package:drama_flix/feature/onboarding/presentation/widget/welcome_page.dart';
import 'package:drama_flix/generated/assets.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingMainPage extends StatelessWidget {
  const OnboardingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: _OnboardingContent(),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  final PageController pageController = PageController();

  List<Widget> get pages => const [
    WelcomePage(),
    TrendingPage(),
    FindPage(),
    ExplorePage(),
    SubscribePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final int currentPage = state.currentPage;
        return Stack(
          children: [
            Image.asset(Assets.backgroundOnboarding),
            PageView(
              controller: pageController,
              onPageChanged: (int page) {
                context.read<OnboardingCubit>().updatePage(page);
              },
              children: pages.map((pageItem) => pageItem).toList(),
            ),
            Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  _buildDotIndicator(currentPage, pages.length),
                  const SizedBox(height: 20),
                  _buildButtons(
                    context,
                    pageController,
                    currentPage,
                    pages.length,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDotIndicator(int currentPage, int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 10.0,
          width: currentPage == index ? 30.0 : 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.white : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(
    BuildContext context,
    PageController pageController,
    int currentPage,
    int totalPages,
  ) {
    final appLocalizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentPage != totalPages - 1
              ? TextButton(
                  onPressed: () {
                    navigatePage(context);
                  },
                  child: Text(
                    appLocalizations.onboardingSkipButton,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                )
              : const SizedBox.shrink(),
          ElevatedButton(
            onPressed: () {
              currentPage != totalPages - 1
                  ? pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    )
                  : navigatePage(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            ),
            child: Text(
              appLocalizations.onboardingNextButton,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  navigatePage(BuildContext context) async {
    PrefsHelper.setHasSeenOnboarding(true);
    if (!context.mounted) return;
    final authCubit = context.read<AuthCubit>();
    final page = authCubit.state.user != null
        ? const MainPage()
        : const LoginPage();
    context.pushAndRemoveAll(page);
  }
}
