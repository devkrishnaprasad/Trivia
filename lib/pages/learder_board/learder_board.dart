import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:trivia/pages/learder_board/user_card.dart';

class LearderBoard extends StatefulWidget {
  const LearderBoard({super.key});

  @override
  State<LearderBoard> createState() => _LearderBoardState();
}

class _LearderBoardState extends State<LearderBoard> {
  List<Color> containerColors = List.generate(3, (index) => Colors.blue);

  int selectedFilter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 159, 224),
        title: const Text(
          "Leaderboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            height: 10.h,
            color: const Color.fromARGB(255, 81, 159, 224),
          ),
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              width: double.infinity,
              height: 300,
              color: const Color.fromARGB(255, 81, 159, 224),
              child: Column(
                children: [
                  // Toggle Button section START
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
                          child: GestureDetector(
                            onTap: () => setState(() {
                              selectedFilter = 1;
                            }),
                            child: Container(
                              width: 90.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedFilter == 1
                                      ? const Color.fromARGB(255, 81, 159, 224)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  'All Time',
                                  style: TextStyle(
                                      color: selectedFilter == 1
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              selectedFilter = 2;
                            }),
                            child: Container(
                              width: 90.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedFilter == 2
                                      ? const Color.fromARGB(255, 81, 159, 224)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  'All Time',
                                  style: TextStyle(
                                      color: selectedFilter == 2
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              selectedFilter = 3;
                            }),
                            child: Container(
                              width: 90.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedFilter == 3
                                    ? const Color.fromARGB(255, 81, 159, 224)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Month',
                                  style: TextStyle(
                                      color: selectedFilter == 3
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Toggle Button section END

                  // Top 3 Ranking Section START
                  Padding(
                    padding: EdgeInsets.only(top: 0.h, left: 30.w),
                    child: SizedBox(
                      height: 140.h,
                      width: 300.w,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 55.h),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/user.png',
                                          width: 50.w,
                                          height: 50.h,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -4.h,
                                      left: 20.w,
                                      child: Container(
                                        width: 15.w,
                                        height: 15.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Text(
                                  "Arun kumar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "120,000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.h, left: 30.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    'assets/images/crown.png',
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/user.png',
                                          width: 50.w,
                                          height: 50.h,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -1.h,
                                      left: 20.w,
                                      child: Container(
                                        width: 15.w,
                                        height: 15.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Text(
                                  "Arun kumar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "120,000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 55.h, left: 30.w),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/user.png',
                                          width: 50.w,
                                          height: 50.h,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -1.h,
                                      left: 20.w,
                                      child: Container(
                                        width: 15.w,
                                        height: 15.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orange,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '3',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Text(
                                  "Arun kumar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "120,000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  // Top 3 Ranking Section END
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const UserListCard();
              },
            ),
          )
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
