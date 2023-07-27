import 'package:adhils_portfolio/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../theme_provider.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      return SkillsDesktopView(
        size: size,
      );
    });
  }
}

class SkillsDesktopView extends StatelessWidget {
  final SizingInformation size;

  const SkillsDesktopView({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (size.isMobile)
            const Divider(
              thickness: 3,
            ),
          Text(
            'Skills',
            style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.displayMedium)
                .copyWith(
                    color: provider.theme == ThemeData.dark()
                        ? Colors.white
                        : Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: size.isMobile ? 50 : 100,
              childAspectRatio: 1,
              crossAxisCount: size.isDesktop ? 4 : 1,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: skills.length,
            itemBuilder: (BuildContext context, int index) {
              return OutlineSkillsContainer(
                size: size,
                index: index,
              );
            },
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}

class OutlineSkillsContainer extends StatelessWidget {
  const OutlineSkillsContainer({
    super.key,
    required this.index,
    required this.size,
  });

  final int index;
  final SizingInformation size;

  // final int rowIndex;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    const colors = ColorAssets.all;
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: colors.elementAt(index % colors.length),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(skills.elementAt(index),
            style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headlineMedium)
                .copyWith(
                    color: provider.theme == ThemeData.dark()
                        ? Colors.white
                        : Colors.black,
                    fontSize: size.isMobile ? 24 : null)
            //Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: size.isMobile? 24: null),
            ));
  }
}

final skills = [
  'Flutter',
  'Firebase',
  'Rest Api',
  'JavaScript',
  'NodeJs',
  'Express',
  'Mongo-Db',
  'Hive',
  'Android',
  'iOS',
  'Web',
  'HTML/CSS',
];

class ColorAssets {
  static const Color red = Color.fromRGBO(255, 87, 87, 1);
  static const Color blue = Color.fromRGBO(82, 113, 255, 1);
  static const Color green = Color.fromRGBO(97, 242, 162, 1);
  static const Color yellow = Color.fromRGBO(255, 222, 89, 1);
  static const Color orange = Colors.orangeAccent;
  static const Color purple = Colors.purpleAccent;

  static const List<Color> all = [red, blue, green, yellow, orange, purple];
}
