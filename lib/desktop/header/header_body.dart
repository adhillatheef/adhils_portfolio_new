import 'package:adhils_portfolio/hover_effect.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../skills/skills_section.dart';
import '../../theme_provider.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;

  const HeaderBody({
    super.key,
    required this.isMobile,
  });

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['adhillatheeflas@gmail.com'],
      subject: 'mailto example subject',
      body: 'mailto example body',
    );

    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "I'm an Auto-didactic ",
          style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headlineMedium)
              .copyWith(fontSize: 50),
          maxLines: 1,
        ),
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: ColorAssets.all, // Define your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: AutoSizeText(
                "Flutter Developer < / >",
                style: GoogleFonts.montserrat(
                        textStyle: Theme.of(context).textTheme.headlineMedium)
                    .copyWith(
                  color: Colors.white,
                  fontSize: 60,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: isMobile ? 20 : 37,
        ),
        AutoSizeText(
          "I have 2 years of experience in building android and ios applications",
          style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headlineMedium)
              .copyWith(fontSize: 24),
          maxLines: 3,
        ),
        const SizedBox(
          height: 40,
        ),
        OnHover(builder: (isHover) {
          return OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: isHover ? ColorAssets.red : null,
                  side: const BorderSide(
                    width: 3,
                    color: ColorAssets.red,
                  )),
              onPressed: launchMailto,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 10 : 17,
                    horizontal: isMobile ? 8 : 15),
                child: AutoSizeText("Contact Me",
                    style: GoogleFonts.montserrat(
                            textStyle:
                                Theme.of(context).textTheme.headlineSmall)
                        .copyWith(
                            color: isHover
                                ? Colors.white
                                : provider.theme == ThemeData.dark()
                                    ? Colors.white
                                    : Colors.black)
                    //TextStyle(fontSize: isMobile? 20:24, color:isHover?Colors.white: Colors.black),
                    ),
              ));
        })
      ],
    );
  }
}
