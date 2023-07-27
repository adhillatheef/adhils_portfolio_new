import 'package:flutter/material.dart';
import '../../desktop/header/header_body.dart';

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.9,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          children: [
            Expanded(child: Image.asset("images/imageedit_2_6764513897.png",)),
            const HeaderBody(isMobile: true),
          ],
        ),
      ),
    );
  }
}