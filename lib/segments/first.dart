import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSegment extends StatelessWidget {
  const FirstSegment({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final isWide = MediaQuery.sizeOf(context).width > 600;

    final isMobile = screenWidth < 400;
    final isTablet = screenWidth >= 400 && screenWidth <= 800;

    final topTextFontSize =
        isMobile
            ? 20.0
            : isTablet
            ? 24.0
            : 28.0;
    final middleTextFontSize =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;
    final bottomTextFontSize =
        isMobile
            ? 14.0
            : isTablet
            ? 18.0
            : 22.0;

    final padding =
        isMobile
            ? 16.0
            : isTablet
            ? 24.0
            : 32.0;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Top Text
              Text(
                "You're Invited to".toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w900,
                  fontSize: topTextFontSize,
                  color: const Color.fromRGBO(27, 60, 30, 1),
                ),
              ),
              const SizedBox(height: 24),

              // SVG Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/x.svg",
                    // width: 10,
                    semanticsLabel: 'Bottle',
                  ),
                  SizedBox(width: 24),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SvgPicture.asset(
                      "assets/y.svg",
                      height:
                          isWide ? screenHeight * 0.12 : screenHeight * 0.09,
                      // width: 50,
                      semanticsLabel: 'Diaper',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Middle and Bottom Texts
              Column(
                children: [
                  Text(
                    "Honouring\nLove + What's To Come".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: middleTextFontSize,
                      color: const Color.fromRGBO(27, 60, 30, 1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Saturday May 24th\n53082 MUN 41E, St. Genevieve, MB'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: bottomTextFontSize,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(27, 60, 30, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
