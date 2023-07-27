import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constants.dart';
import '../skills/skills_section.dart';
import '../theme_provider.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    const colors = ColorAssets.all;
    return ResponsiveBuilder(builder: (_, size) {
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
            Text('Education',
                style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.displayMedium)
                    .copyWith(
                        color: provider.theme == ThemeData.dark()
                            ? Colors.white
                            : Colors.black)),
            const SizedBox(
              height: 20,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (size.isMobile || size.isTablet) {
                  return Column(
                    children: educationItems.map((e) {
                      int index =
                          educationItems.indexWhere((item) => item == e);
                      return EducationWidget(
                        size: size,
                        colors: colors,
                        index: index,
                        educationItem: e,
                      );
                    }).toList(),
                  );
                } else {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 10.0,
                              mainAxisExtent: 400,
                              crossAxisCount: 2),
                      itemCount: educationItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EducationWidget(
                          size: size,
                          colors: colors,
                          index: index,
                          educationItem: educationItems[index],
                        );
                      });
                }
              },
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      );
    });
  }
}

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
    required this.colors,
    required this.index,
    required this.educationItem,
    required this.size,
  });

  final EducationItem educationItem;
  final List<Color> colors;
  final int index;
  final SizingInformation size;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: colors.elementAt(index % colors.length),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(educationItem.course,
                style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineMedium)
                    .copyWith(
                        color: provider.theme == ThemeData.dark()
                            ? Colors.white
                            : Colors.black)),
            const SizedBox(
              height: 20,
            ),
            size.isMobile || size.isTablet
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        educationItem.college,
                          style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.headlineSmall).copyWith(
                              color:   provider.theme==ThemeData.dark()?Colors.white:Colors.black
                          )
                      ),
                      Text(
                        educationItem.mark,
                          style: GoogleFonts.montserrat().copyWith(
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          educationItem.college,
                            style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.headlineSmall).copyWith(
                                color:   provider.theme==ThemeData.dark()?Colors.white:Colors.black
                            )
                        ),
                      ),
                      Flexible(
                        child: Text(
                          educationItem.mark,
                            style: GoogleFonts.montserrat().copyWith(
                                color:   provider.theme==ThemeData.dark()?Colors.white.withOpacity(0.6):Colors.black.withOpacity(0.6),
                              fontStyle: FontStyle.italic
                            )
                        ),
                      ),
                    ],
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(educationItem.year, style: GoogleFonts.montserrat().copyWith(
                color:   provider.theme==ThemeData.dark()?Colors.white:Colors.black
            )),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\u2022',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    educationItem.description,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: GoogleFonts.montserrat()
                        .copyWith(
                      color:
                      provider.theme == ThemeData.dark()
                          ? Colors.white.withOpacity(0.6)
                          : Colors.black.withOpacity(0.6),
                      height: 1.55,
                      fontSize: 16,
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EducationItem {
  final String course;
  final String college;
  final String year;
  final String mark;
  final String description;

  EducationItem({
    required this.course,
    required this.college,
    required this.year,
    required this.mark,
    required this.description,
  });
}

final educationItems = [
  EducationItem(
    course: "BCA - Bachelor of Computer Applications.",
    college: "Bishop Heber College - Trichy",
    year: "06/2018 - 06/2021",
    mark: "8.23 CGPA",
    description:
        "I completed my BCA degree, gaining a well-rounded education in computer science. Covered topics: programming, databases, software engineering, computer networks, web development, algorithms. Hands-on projects developed strong technical skills. Prepared for success in the computer science field.",
  ),
  EducationItem(
    course: "HSC - Higher Secondary",
    college: "S.B.I.O.A, MHSS - Trichy",
    year: "06/2015 - 06/2017",
    mark: "69%",
    description: "Computer Science",
  ),
];
