import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:to_do_list/MainScreen/homepage.dart';

class Introduce extends StatefulWidget {
  const Introduce({Key? key}) : super(key: key);

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  String skip = 'skip';
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _skip();
  }

  _skip() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs!.getString('skip') == 'skip') {
      const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: '해야하는 일을 리스트에 추가하세요',
            body: '꼭 해야 하는 일부터 사소한 일까지',
            image: Image.asset('assets/img/introduce1.png', width: 270.w),
            decoration: getPageDecoration()),
        PageViewModel(
            title: '리스트를 통해 할 일을 정리해 보세요',
            body: '그러곤 완벽하게 해야 할 일을 해내세요',
            image: Image.asset('assets/img/introduce2.png', width: 270.w),
            decoration: getPageDecoration()),
        PageViewModel(
            title: '한 주간의 일들을 돌아보세요',
            body: '주간 리포트를 활용해 한 주간의 일들을 정리해봐요',
            image: Image.asset('assets/img/introduce3.png', width: 270.w),
            decoration: getPageDecoration()),
      ],
      done: const Text('done', style: TextStyle(color: Colors.white)),
      onDone: () {
        _prefs!.setString('skip', skip);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      },
      allowImplicitScrolling: true,
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      skip: const Text('Skip', style: TextStyle(color: Colors.white)),
      dotsDecorator: DotsDecorator(
          color: Colors.black12,
          activeColor: Colors.lightBlueAccent,
          size: Size(15.w, 10.h),
          activeSize: Size(10.w, 10.h),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
      curve: Curves.fastOutSlowIn,
      globalBackgroundColor: const Color(0xFF3e63fc),
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      imagePadding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 0.h),
      titlePadding: EdgeInsets.fromLTRB(0.w, 50.h, 0.w, 10.h),
      bodyPadding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 10.h),
      pageColor: const Color(0xFF3e63fc),
    );
  }
}
