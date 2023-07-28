import 'package:adhils_portfolio/skills/skills_section.dart';
import 'package:adhils_portfolio/theme_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../hover_effect.dart';

class NavigationBarView extends StatelessWidget {
  final Function() navigateToProjects;
  final Function() navigateToSkills;
  final Function() navigateToExperience;
  final Function() navigateToEducation;
  final Function() navigateToCertificates;
  final Function() navigateToAchievements;

  const NavigationBarView({
    Key? key,
    required this.navigateToProjects,
    required this.navigateToSkills,
    required this.navigateToExperience,
    required this.navigateToEducation,
    required this.navigateToCertificates,
    required this.navigateToAchievements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile || size.isTablet) {
        return SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              // Image.asset(
              //   "/imageedit_4_4075437235.png",
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: ColorAssets.all,
                      // Define your gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: AutoSizeText('Adhil Latheef',
                      style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.headlineSmall)
                          .copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              ),
              const Spacer(),
              ThemeButton(provider: provider),
              ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorAssets.red,
                        ColorAssets.blue,
                        ColorAssets.orange,
                        ColorAssets.purple,
                      ],
                    ).createShader(bounds);
                  },
                  child: IconButton(
                    icon: const Icon(Icons.menu,color: Colors.white,),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ))
              // IconButton(
              //   icon: const Icon(Icons.menu),
              //   onPressed: () => Scaffold.of(context).openEndDrawer(),
              // )
            ],
          ),
        );
      }
      return SizedBox(
        height: 70,
        width: 1507,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: ColorAssets.all, // Define your gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: AutoSizeText('Adhil Latheef',
                      style: GoogleFonts.montserrat(
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium)
                          .copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              ),
              // Image.asset(
              //   "/imageedit_4_4075437235.png",
              // ),
              const Spacer(),
              ThemeButton(provider: provider),
              NavigationBarItem(
                color: ColorAssets.red,
                onPressed: navigateToProjects,
                text: "Projects",
              ),
              NavigationBarItem(
                color: ColorAssets.green,
                onPressed: navigateToSkills,
                text: "Skills",
              ),
              NavigationBarItem(
                color: ColorAssets.blue,
                onPressed: navigateToExperience,
                text: "Experience",
              ),
              NavigationBarItem(
                color: ColorAssets.yellow,
                onPressed: navigateToEducation,
                text: "Education",
              ),
              NavigationBarItem(
                color: ColorAssets.orange,
                onPressed: navigateToCertificates,
                text: "Certificates",
              ),
              NavigationBarItem(
                color: ColorAssets.purple,
                onPressed: navigateToAchievements,
                text: "Achievements",
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ThemeButton extends StatefulWidget {
  const ThemeButton({
    super.key,
    required this.provider,
  });

  final ThemeProvider provider;

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.provider.toggleTheme();
        },
        icon: widget.provider.theme == ThemeData.dark()
            ? const Icon(Icons.sunny)
            : const Icon(Icons.nightlight_outlined));
  }
}

class NavigationBarItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const NavigationBarItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Flexible(
      child: OnHover(builder: (isHovered) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            // width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: isHovered ? color : Colors.transparent,
              border: Border.all(
                width: 3,
                color: color,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: onPressed,
                  child: Text(
                      maxLines: 1,
                      text,
                      style: GoogleFonts.montserrat().copyWith(
                          fontWeight: FontWeight.bold,
                          color: isHovered
                              ? Colors.white
                              : provider.theme == ThemeData.dark()
                                  ? Colors.white
                                  : Colors.black)
                      // TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: isHovered ? Colors.white : Colors.black),
                      )),
            ),
          ),
        );
      }),
    );
  }
}
