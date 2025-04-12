import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdSegment extends StatelessWidget {
  const ThirdSegment({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              colors: [Color(0xFFE4715E), Color(0xFFD95B43)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child:
              screenWidth > 800
                  ? Row(
                    children: [
                      // Form
                      Expanded(child: _buildFormSection()),
                      const SizedBox(width: 32),
                      // Invite Text
                      Expanded(child: _buildInviteSection()),
                    ],
                  )
                  : Column(
                    children: [
                      _buildInviteSection(),
                      const SizedBox(height: 24),
                      _buildFormSection(),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _styledTextField("Name"),
        const SizedBox(height: 16),
        _styledTextField("Email"),
        const SizedBox(height: 16),
        _styledTextField("Mobile"),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.send_rounded),
          label: Text("RSVP Now"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Color(0xFF1B3C1E),
            textStyle: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _styledTextField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildInviteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '💍 ALYSE + JORDAN’S ENGAGEMENT PARTY',
          textAlign: TextAlign.center,
          style: GoogleFonts.ptSerif(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Color(0xFF1B3C1E),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '📍 5:00 PM – 8:00 PM (OR LATE)\n\nRaise a glass with us over drinks, a taco bar,\nmusic, yard games and a cozy bonfire.',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            height: 1.5,
            color: Color(0xFF1B3C1E),
          ),
        ),
      ],
    );
  }
}
