import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearderBoard extends StatefulWidget {
  const LearderBoard({super.key});

  @override
  State<LearderBoard> createState() => _LearderBoardState();
}

class _LearderBoardState extends State<LearderBoard> {
  int selectedIndex = 0;

  List<Color> containerColors = List.generate(3, (index) => Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 159, 224),
        title: const Text(
          "Leaderboard",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              width: double.infinity,
              height: 300,
              color: const Color.fromARGB(255, 81, 159, 224),
              child: Column(
                children: [
                  Container(
                    width: 290.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                              width: 90.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text('All Time'),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                              width: 90.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text('All Time'),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                              width: 90.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text('All Time'),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 50) // Straight line to bottom-left
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 50,
      ) // Quadratic bezier curve to bottom-right
      ..lineTo(size.width, 0); // Straight line to top-right

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
