import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../constants.dart';
import '../../mobile/header/mobile_view.dart';

import 'header_body.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * 0.47;
    return ResponsiveBuilder(
      builder: (_, size){
        if(size.isMobile) return const HeaderMobileView();
        return SizedBox(
          height: 864,
          width: kInitWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children:  [
                const Expanded(
                  child: HeaderBody(isMobile: false),
                ),
                Image.asset("images/imageedit_2_6764513897.png", height:isSmall? imageWidth:  500,)
              ],
            ),
          ),
        );
      },
    );
  }
}




