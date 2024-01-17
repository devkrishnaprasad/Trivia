import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListCard extends StatefulWidget {
  const UserListCard({super.key});

  @override
  State<UserListCard> createState() => _UserListCardState();
}

class _UserListCardState extends State<UserListCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Container(
            height: 50.h,
            width: 320.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    '4',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Image.asset(
                    'assets/images/user.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Simith Carlo',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70.w),
                  child: Text(
                    '91,700',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 8, 157, 203),
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
