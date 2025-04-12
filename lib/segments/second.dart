import 'package:alysejordan/segments/rsvp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondSegment extends StatelessWidget {
  const SecondSegment({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return Container(
      height: MediaQuery.sizeOf(context).height,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: isWide ? 60 : 40),
            child: Text(
              'Drop by for a joint celebration as we welcome\nBaby Kaia’s arrival and Alyse + Jordan’s engagement.'
                  .toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w900,
                fontSize: isWide ? 24 : 16,

                color: Color.fromRGBO(27, 60, 30, 1),
                height: 1.6,
              ),
            ),
          ),
          Spacer(),
          isWide
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _eventBlock(
                    iswide: isWide,

                    emoji: '👶',
                    title: "Baby Kaia's Debut",
                    time: "3:00 PM – 5:00 PM",
                    desc:
                        "Pastries, coffee, and sweet tunes as we\nintroduce our newest addition.",
                  ),
                  _eventBlock(
                    iswide: isWide,

                    emoji: '💍',
                    title: "Alyse + Jordan’s Engagement Party",
                    time: "5:00 PM – 8:00 PM (or late)",
                    desc:
                        "Raise a glass with us over drinks, a taco\nbar, music, yard games and a cozy bonfire.",
                  ),
                ],
              )
              : Column(
                children: [
                  _eventBlock(
                    iswide: isWide,
                    emoji: '👶',
                    title: "Baby Kaia's Debut",
                    time: "3:00 PM – 5:00 PM",
                    desc:
                        "Pastries, coffee, and sweet tunes as we\nintroduce our newest addition.",
                  ),
                  const SizedBox(height: 40),
                  _eventBlock(
                    iswide: isWide,

                    emoji: '💍',
                    title: "Alyse + Jordan’s Engagement Party",
                    time: "5:00 PM – 8:00 PM (or late)",
                    desc:
                        "Raise a glass with us over drinks, a taco\nbar, music, yard games and a cozy bonfire.",
                  ),
                ],
              ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              showBigRsvpDialog(context, RsvpForm());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(27, 60, 30, 1),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: Text(
              "RSVP",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 32,
            children: [
              GestureDetector(
                onTap: () {
                  showBigRsvpDialog(context, buildDirectionsSection());
                },
                child: _navLink("DIRECTIONS"),
              ),
              GestureDetector(
                onTap: () {
                  showBigRsvpDialog(context, buildEventDetails());
                },
                child: _navLink("WHAT TO WEAR"),
              ),
              GestureDetector(
                onTap: () {
                  showBigRsvpDialog(context, buildGifts());
                },
                child: _navLink("GIFTS + SUPPORT"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _eventBlock({
    required String emoji,
    required String title,
    required String time,
    required String desc,
    required bool iswide,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$emoji ${title.toUpperCase()}',
          textAlign: TextAlign.center,

          style: GoogleFonts.montserrat(
            fontSize: iswide ? 14 : 12,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(27, 60, 30, 1),
          ),
        ),
        SizedBox(height: iswide ? 24 : 18),
        Text(
          time,
          textAlign: TextAlign.center,

          style: GoogleFonts.montserrat(
            fontSize: iswide ? 13 : 12,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          desc.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: iswide ? 13 : 12,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _navLink(String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: const Color.fromRGBO(27, 60, 30, 1),
        letterSpacing: 1,
      ),
    );
  }

  void showBigRsvpDialog(BuildContext context, Widget widget) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    final isMobile = screenWidth < 400;
    final padding = isMobile ? 20.0 : 30.0;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (_) => Dialog(
            backgroundColor: const Color.fromRGBO(210, 181, 178, 1),
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.05,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.8,
              padding: EdgeInsets.all(padding),
              child: widget,
            ),
          ),
    );
  }

  Widget buildDirectionsSection() {
    final textColor = const Color.fromRGBO(27, 60, 30, 1);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "🌾 FROM THE CITY TO THE COUNTRY – A SCENIC ROUTE FROM KILDONAN PLACE 🚗🐄",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 24),

          // 📍 Where are we going?
          Text(
            "📍 WHERE ARE WE GOING?",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "53082 MUNICIPAL RD 41E, TACHÉ, MB R0A 0J0",
            style: GoogleFonts.montserrat(fontSize: 14, color: textColor),
          ),
          const SizedBox(height: 24),

          // 🗺️ Need directions?
          Text(
            "🗺️ NEED DIRECTIONS?",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "JUST POP THIS INTO GOOGLE MAPS:",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "👉 53082 MUNICIPAL RD 41E, TACHÉ, MB",
            style: GoogleFonts.montserrat(fontSize: 14, color: textColor),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(
                'https://maps.google.com/?q=53082+Municipal+RD+41E,+Taché,+MB',
              );
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Text(
              "OR CLICK THIS HANDY LINK: HERE",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.green[900],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // 🐄 Heads-Up
          Text.rich(
            textAlign: TextAlign.center,

            TextSpan(
              children: [
                const TextSpan(text: "🐄 "),
                TextSpan(
                  text: "HEADS-UP: ",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text:
                      "YOU'RE OFFICIALLY IN COW COUNTRY. EXPECT PEACEFUL ROADS, ENDLESS FIELDS, AND MAYBE A FEW MOOING SPECTATORS. "
                      "RURAL HIGHWAYS MIGHT EVEN TOSS IN A GRAVEL ROAD FOR THAT AUTHENTIC ADVENTURE FEEL.",
                  style: GoogleFonts.montserrat(color: textColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 🎈 Final line
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                const TextSpan(text: "🎈 "),
                TextSpan(
                  text:
                      "BRING YOUR GOOD VIBES, YOUR APPETITE FOR FUN, AND MAYBE A PHONE CHARGER ",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text:
                      "(BECAUSE NO ONE WANTS A DEAD BATTERY WHEN YOU’RE TRYING TO POST SUNSET PICS). WE CAN’T WAIT TO SEE YOU!",
                  style: GoogleFonts.montserrat(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGifts() {
    final textColor = const Color.fromRGBO(27, 60, 30, 1);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSection("🎁", "", textColor),
          buildSection(
            "The best present is your presence!",
            "But if you’d like to bring a little something, a book with a personal message for Kaia’s library would be truly special—or a contribution to her future playground fund is always appreciated.",
            textColor,
          ),
          buildSection(
            "We’re also so happy to be welcoming Alyse, Jordan, Kaia and the fur babies back to Winnipeg this coming year!",
            "As they start this exciting chapter—building a home and planning their wedding—your love and support mean the world. ",
            textColor,
          ),
        ],
      ),
    );
  }

  Widget buildEventDetails() {
    final textColor = const Color.fromRGBO(27, 60, 30, 1);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSection(
            "👗 WHAT TO WEAR",
            "Our celebration’s on a beautiful rural property — casual, outdoorsy, and full of good vibes!",
            textColor,
          ),
          buildSection(
            "🌤️ WEATHER",
            "Expect mild temps (15–22°C), but spring can be unpredictable — bring a light jacket just in case.",
            textColor,
          ),
          buildSection(
            "👟 SHOES",
            "We'll be on grass + gravel, so skip the heels! Go for flats, sneakers, sandals, or boots.",
            textColor,
          ),
          buildSection(
            "💐 DRESS VIBES",
            "• Baby Debut (2–4 PM): Cute + casual – sundresses, jeans + a nice top, relaxed fits.\n\n"
                "• Engagement Party (6–8 PM): Backyard chic – flowy dresses, linen, nice denim, etc.",
            textColor,
          ),
          buildSection(
            "🔥 BONFIRE TIP",
            "Staying late? Feel free to bring a change of comfy clothes (hoodie, joggers, etc.) for relaxing by the fire.",
            textColor,
          ),
          buildSection(
            "🌧️ IF IT RAINS, WE’LL MOVE INSIDE!",
            "Dress to feel good, move easy, and enjoy the day — we can’t wait to see you!",
            textColor,
          ),
        ],
      ),
    );
  }

  Widget buildSection(String title, String body, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            textAlign: TextAlign.center,

            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: textColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
