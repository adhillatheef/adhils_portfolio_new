import 'package:adhils_portfolio/skills/skills_section.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constants.dart';
import '../theme_provider.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

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
            AutoSizeText('Experience',
                style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.displayMedium)
                    .copyWith(
                        color: provider.theme == ThemeData.dark()
                            ? Colors.white
                            : Colors.black)),
            const SizedBox(
              height: 20,
            ),
            size.isDesktop
                ? GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: size.isMobile || size.isTablet ? 1 : 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 10.0,
                      mainAxisExtent: 700,
                    ),
                    itemCount: experiences.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExperienceContainer(
                        color: colors.elementAt(index),
                        experienceInfo: experiences[index],
                      );
                    },
                  )
                : Column(
                    children: experiences.map((e) {
                      int index =
                          experiences.indexWhere((element) => element == e);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ExperienceContainer(
                          color: colors.elementAt(index),
                          experienceInfo: experiences[index],
                        ),
                      );
                    }).toList(),
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

class ExperienceContainer extends StatelessWidget {
  final ExperienceInfo experienceInfo;
  final Color color;

  const ExperienceContainer({
    super.key,
    required this.experienceInfo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: color),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(experienceInfo.position,
                style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineMedium)
                    .copyWith(
                        color: provider.theme == ThemeData.dark()
                            ? Colors.white
                            : Colors.black)),
            Text(experienceInfo.company,
                style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineSmall)
                    .copyWith(
                        color: provider.theme == ThemeData.dark()
                            ? Colors.white
                            : Colors.black)),
            const SizedBox(
              height: 20,
            ),
            Text(
              experienceInfo.timeLine,
              style: GoogleFonts.montserrat(),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: experienceInfo.description
                  .map((e) => Row(
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
                          Flexible(
                            child: AutoSizeText(e,
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

                                // TextStyle(
                                //   fontSize: 16,
                                //   color: Colors.black.withOpacity(0.6),
                                //   height: 1.55,
                                // ),
                                ),
                          ),
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ExperienceInfo {
  final String position;
  final String company;
  final String timeLine;
  final List<String> description;

  ExperienceInfo(
      {required this.position,
      required this.company,
      required this.timeLine,
      required this.description});
}

final experiences = [
  ExperienceInfo(
    position: 'Macro Global Technologies - Trichy',
    company: "Trainee Developer - Mobile Platforms",
    timeLine: "Jul/2022 - mar/2023",
    description: [
      "As a developer, my responsibilities included analyzing existing code, prioritizing clean and optimized code, and debugging and fixing production issues.",
      "I gained knowledge of Bloc architecture and banking application development, which I applied to self-study advanced Flutter concepts and implement them in the app.",
      "In addition to designing the UI and implementing encryption, I collaborated with the API team and became proficient with Postman and Swagger.",
      "I successfully migrated the older Flutter app to the latest version, showcasing my ability to adapt to new technology and maintain functionality.",
      "I developed a Flutter application for liveness detection, utilizing the API provided by the AI and ML team. I successfully implemented a functional model and achieved timely delivery of accurate outputs."
    ],
  ),
  ExperienceInfo(
    position: 'Brototype - Calicut',
    company: "Apprenticeship - Flutter developer",
    timeLine: "march/2022 - july/2023",
    description: [
      "Enhanced skills and knowledge in developing applications using the Flutter framework during Flutter developer apprenticeship.",
      "Consistently completed weekly tasks and submitted reports ahead of deadlines.",
      "Documented various activities, including reading books, attending tech seminars, and completing projects.",
      "Received close monitoring and valuable feedback from experienced professionals.",
      "Developed a solid foundation in Flutter development through the apprenticeship.",
      "Equipped with confidence to tackle future challenges in the field."
    ],
  )
];
