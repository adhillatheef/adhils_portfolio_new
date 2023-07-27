import 'package:adhils_portfolio/constants.dart';
import 'package:adhils_portfolio/hover_effect.dart';
import 'package:adhils_portfolio/skills/skills_section.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  Future<void> launchURL({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const colors = ColorAssets.all;
    return ResponsiveBuilder(builder: (_, size) {
      final currentYear = DateTime.now().year;
      return Container(
        height: 200,
        width: kInitWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text("© Adhil Latheef $currentYear --"),
            const Spacer(),
            for(int index = 0; index < socials.length; index++)
              OnHover(
                builder: (isHover) {
                  return IconButton(onPressed: ()=> launchURL(url: socials[index].url), icon: socials[index].icon, color: colors.elementAt(index % colors.length));
                }
              )
          ],
        ),
      );
    });
  }
}

class SocialInfo {
  final Widget icon;
  final String url;
  SocialInfo({required this.icon, required this.url});
}

final socials = [
  SocialInfo(icon: const FaIcon(FontAwesomeIcons.github,), url: "https://github.com/adhillatheef"),
  SocialInfo(icon: const FaIcon(FontAwesomeIcons.linkedin), url: "https://www.linkedin.com/in/adhil-latheef"),
  SocialInfo(icon: const FaIcon(FontAwesomeIcons.instagram), url: "https://www.instagram.com/adhillatheef"),
];