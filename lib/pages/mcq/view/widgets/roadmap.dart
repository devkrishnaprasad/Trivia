import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoadMapWidget extends StatefulWidget {
  const RoadMapWidget({super.key});

  @override
  State<RoadMapWidget> createState() => _RoadMapWidgetState();
}

class _RoadMapWidgetState extends State<RoadMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(
          '1',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
