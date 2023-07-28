import 'package:adhils_portfolio/hover_effect.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../constants.dart';
import '../skills/skills_section.dart';
import '../theme_provider.dart';

class Certifications extends StatelessWidget {
  const Certifications({Key? key}) : super(key: key);

  void showImageAlertDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.asset(imagePath),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
              AutoSizeText('Certificates',
                  style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.displayMedium)
                      .copyWith(
                          color: provider.theme == ThemeData.dark()
                              ? Colors.white
                              : Colors.black)),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: certificationsItems.map((e) {
                  int index =
                      certificationsItems.indexWhere((item) => item == e);
                  return OnHover(builder: (isHovered) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            colors.elementAt(index % colors.length),
                      ),
                      title: InkWell(
                        onTap: () => showImageAlertDialog(context, e.pdfPath),
                        child: Card(
                          elevation: isHovered ? 5 : null,
                          shadowColor: isHovered
                              ? colors
                                  .elementAt(index % colors.length)
                                  .withOpacity(0.6)
                              : null,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 3,
                                color: colors.elementAt(index % colors.length)),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.name,
                                      style: GoogleFonts.montserrat(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall)
                                          .copyWith(
                                              fontSize:
                                                  size.isMobile ? 16 : null,
                                              color: provider.theme ==
                                                      ThemeData.dark()
                                                  ? Colors.white
                                                  : Colors.black)),
                                  Text(e.institution,
                                      style: GoogleFonts.montserrat(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium))
                                ],
                              ),
                              subtitle: !size.isMobile
                                  ? Text("Credentials: ${e.credentials}")
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.dateOfIssue,
                                          style: GoogleFonts.montserrat()
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          e.credentials,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                              trailing: size.isMobile
                                  ? const SizedBox()
                                  : Text(e.dateOfIssue,style: GoogleFonts.montserrat()
                                  .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ));
    });
  }
}

class CertificationItem {
  final String name;
  final String institution;
  final String credentials;
  final String dateOfIssue;
  final String pdfPath;

  CertificationItem({
    required this.name,
    required this.institution,
    required this.credentials,
    required this.dateOfIssue,
    required this.pdfPath,
  });
}

final certificationsItems = [
  CertificationItem(
    name: 'The Fundamentals of Digital Marketing',
    institution: "Google Digital Unlocked",
    credentials: "686 T2K 4TZ",
    dateOfIssue: "Jul 26, 2020",
    pdfPath: 'images/digitalunlocked_certificate_page-0001.jpg',
  ),
  CertificationItem(
      name: 'The Web Developer Bootcamp',
      institution: "Udemy",
      credentials: "ude.my/UC-decbd38e-b258-41f9-b656-628c3290a8ae/",
      dateOfIssue: "Sep 20, 2020",
      pdfPath: 'images/the_web_developer_bootcamp.jpg'),
  CertificationItem(
      name: 'Python Fundamentals',
      institution: "Microsoft Technology Associate",
      credentials: "CT0001653",
      dateOfIssue: "Jun 06, 2021",
      pdfPath: 'images/mta_python_fundamentals.png'),
  CertificationItem(
      name: 'Flutter- Beginners Course',
      institution: "Udemy",
      credentials: "ude.my/UC-7ba0eacd-908f-4222-a8cf-c301dbef4923/",
      dateOfIssue: "Sept 19, 2021",
      pdfPath: 'images/flutter_beginners_course.jpeg'),
  CertificationItem(
      name: 'Flutter- Intermediate',
      institution: "Udemy",
      credentials: "ude.my/UC-2e8bb171-3500-4e2e-b286-84f9c3103b89/",
      dateOfIssue: "Sept 20, 2021",
      pdfPath: 'images/flutter_intermediate_course.jpeg'),
  CertificationItem(
      name: 'The Complete 2021 Flutter Development Bootcamp with Dart',
      institution: "Udemy",
      credentials: "ude.my/UC-09c44ec9-6b6f-4ab5-a4dd-97bcd014fb6b/",
      dateOfIssue: "Aug 12, 2022",
      pdfPath: 'images/the_complete_2021_development_bootcamp.jpg'),
  CertificationItem(
      name: 'Flutter & Dart - The Complete Guide [2020 Edition]',
      institution: "Udemy",
      credentials: "ude.my/UC-5080ba41-8768-4c6e-a9fd-8ba81ff90684/",
      dateOfIssue: "Oct 3, 2022",
      pdfPath: 'images/flutter_and_dart_the_complete_guide.jpg'),
];
