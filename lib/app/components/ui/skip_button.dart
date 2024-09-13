import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipButton extends StatelessWidget {
  final Function()? onPressed;
  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.skip_next,
              color: Get.theme.scaffoldBackgroundColor,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("SKIP")
          ],
        ),
      ),
    );
  }
}
