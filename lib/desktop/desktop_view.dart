import 'package:adhils_portfolio/certifications/certifications.dart';
import 'package:adhils_portfolio/project/project_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../achievements/achievements.dart';
import '../education/education.dart';
import '../experience/experience_section.dart';
import '../footer/footer.dart';
import '../navigationBar/navigation_bar_view.dart';
import '../skills/skills_section.dart';
import '../theme_provider.dart';
import 'header/header.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _skillKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _certificatesKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  bool _isFabVisible = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _isFabVisible = _scrollController.offset >= 10;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToWidget(GlobalKey key) {
    try {
      final RenderBox? renderBox =
          key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final offset = renderBox.localToGlobal(Offset.zero);
        _scrollController.animateTo(
          offset.dy,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        debugPrint("RenderBox is null. Unable to scroll to widget.");
      }
    } catch (e) {
      debugPrint("error onEvent: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: _isFabVisible? FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0, // Scroll to the top (Y position 0)
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ): null,
      endDrawer: DrawerView(
        navigateToProjects: () => scrollToWidget(_projectKey),
        navigateToSkills: () => scrollToWidget(_skillKey),
        navigateToExperience: () => scrollToWidget(_experienceKey),
        navigateToEducation: ()=> scrollToWidget(_educationKey),
        navigateToCertificates:()=> scrollToWidget(_certificatesKey),
        navigateToAchievements: ()=> scrollToWidget(_achievementsKey),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              NavigationBarView(
                  navigateToProjects: () => scrollToWidget(_projectKey),
                  navigateToSkills: () => scrollToWidget(_skillKey),
                  navigateToExperience: () => scrollToWidget(_experienceKey),
                  navigateToEducation: ()=> scrollToWidget(_educationKey),
                  navigateToCertificates:()=> scrollToWidget(_certificatesKey),
                  navigateToAchievements: ()=> scrollToWidget(_achievementsKey),
              ),
              Header(key: _headerKey),
              ProjectView(key: _projectKey),
              SkillsSection(key: _skillKey),
              ExperienceSection(key: _experienceKey,),
              Education(key: _educationKey),
              Certifications(key: _certificatesKey),
              Achievements(key: _achievementsKey),
              const Footer(),
              // Container(
              //   height: height,
              //   width: width,
              //   color: Colors.blue,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  final Function() navigateToProjects;
  final Function() navigateToSkills;
  final Function() navigateToExperience;
  final Function() navigateToEducation;
  final Function() navigateToCertificates;
  final Function() navigateToAchievements;

  const DrawerView(
      {Key? key,
      required this.navigateToProjects,
      required this.navigateToSkills,
      required this.navigateToExperience,
        required this.navigateToEducation,
        required this.navigateToCertificates,
        required this.navigateToAchievements})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      if (!size.isMobile) return const SizedBox();
      return Drawer(
        child: ListView(
          children: [
            DrawerListTile(
                color: ColorAssets.green,
                onTap: navigateToProjects,
                title: 'Projects'),
            DrawerListTile(
                color: ColorAssets.blue,
                onTap: navigateToExperience,
                title: 'Experience'),
            DrawerListTile(
                color: ColorAssets.red,
                onTap: navigateToSkills,
                title: 'Skills'),
            DrawerListTile(
                color: ColorAssets.yellow,
                onTap: navigateToEducation,
                title: 'Education'),
            DrawerListTile(
                color: ColorAssets.orange,
                onTap: navigateToCertificates,
                title: 'Certification'),
            DrawerListTile(
                color: ColorAssets.purple,
                onTap: navigateToAchievements,
                title: 'Achievements'),
            DrawerListTile(
                color: ColorAssets.green,
                onTap: ()async {
                    if (await canLaunch("https://www.linkedin.com/in/adhil-latheef")) {
                      await launch("https://www.linkedin.com/in/adhil-latheef");
                    } else {
                      throw 'Could not launch "https://www.linkedin.com/in/adhil-latheef"';
                    }
                },
                title: 'My Resume'),
          ],
        ),
      );
    });
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: color,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: ListTile(
            title: Text(
              title,
              style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.headlineMedium).copyWith(
               color:   provider.theme==ThemeData.dark()?Colors.white:Colors.black
              )
              // Theme.of(context)
              //     .textTheme
              //     .headlineMedium
              //     ?.copyWith(color: Colors.black),
            ),
            onTap: onTap,
          )),
    );
  }
}
