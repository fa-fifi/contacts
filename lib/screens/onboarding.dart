import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Future<void> getStarted(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('showHome', true);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF7B51D3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => getStarted(context),
                    child: Text(
                      'Skip',
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (page) =>
                        setState(() => _currentPage = page),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/images/onboarding1.png',
                              ),
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Quick Search',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'Find your contacts easily using keywords.',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/images/onboarding2.png',
                              ),
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Multiple Functionalities',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'Add and sort your contacts.',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/images/onboarding3.png',
                              ),
                              height: 300,
                              width: 300,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'One Call Away',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'Call and text your friends now!',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100,
              width: double.infinity,
              color: Colors.green,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: TextButton(
                    child: Text(
                      "Get Started",
                      style: Theme.of(context).primaryTextTheme.titleLarge,
                    ),
                    onPressed: () => getStarted(context),
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}
