import 'package:flutter/widgets.dart';

class verticalSpace extends StatelessWidget {
  final double height;

  const verticalSpace({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
