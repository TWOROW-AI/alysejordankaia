import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  bool isLoggedIn = false;
  bool isLoading = false;
  List<Map<String, dynamic>> rsvpData = [];
  bool _obscureText = true; // Added for password visibility toggle

  void login() {
    final id = _idController.text.trim();
    final pw = _pwController.text.trim();
    if (id == 'jordan' && pw == 'alysekaia') {
      setState(() => isLoggedIn = true);
      fetchRSVPs();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid ID or Password")));
    }
  }

  Future<void> fetchRSVPs() async {
    setState(() => isLoading = true);
    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('rsvps')
              .orderBy('timestamp', descending: true)
              .get();

      setState(() {
        rsvpData =
            snapshot.docs
                .map((doc) => doc.data())
                .cast<Map<String, dynamic>>()
                .toList();
      });
    } catch (e) {
      print("Error fetching RSVPs: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Admin Login",
          style: GoogleFonts.ptSerif(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: const Color.fromRGBO(27, 60, 30, 1),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _idController,
          decoration: InputDecoration(
            labelText: "ID",
            labelStyle: GoogleFonts.montserrat(
              color: const Color.fromRGBO(27, 60, 30, 1),
              fontWeight: FontWeight.w600,
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(27, 60, 30, 1),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE8D3CF), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
          ),
          style: GoogleFonts.montserrat(
            color: const Color.fromRGBO(27, 60, 30, 1),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: _pwController,
          obscureText: _obscureText, // Controlled by state
          decoration: InputDecoration(
            labelText: "Password",
            labelStyle: GoogleFonts.montserrat(
              color: const Color.fromRGBO(27, 60, 30, 1),
              fontWeight: FontWeight.w600,
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(27, 60, 30, 1),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE8D3CF), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color.fromRGBO(27, 60, 30, 1).withOpacity(0.7),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // Toggle visibility
                });
              },
            ),
          ),
          style: GoogleFonts.montserrat(
            color: const Color.fromRGBO(27, 60, 30, 1),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: login,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE8D3CF),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child:
              isLoading
                  ? const CircularProgressIndicator(
                    color: Color.fromRGBO(27, 60, 30, 1),
                  )
                  : Text(
                    "Login".toUpperCase(),
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(27, 60, 30, 1),
                    ),
                  ),
        ),
      ],
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2);
  }

  Widget _buildRSVPList() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color.fromRGBO(27, 60, 30, 1)),
      );
    }

    if (rsvpData.isEmpty) {
      return Text(
        "No RSVPs found.".toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          color: const Color.fromRGBO(27, 60, 30, 1),
        ),
      );
    }

    return ListView.builder(
      itemCount: rsvpData.length,
      itemBuilder: (context, index) {
        final rsvp = rsvpData[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Color(0xFFE8D3CF), width: 1),
          ),
          elevation: 2,
          color: Colors.white,
          child: ListTile(
            title: Text(
              rsvp['name'] ?? '',
              style: GoogleFonts.ptSerif(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: const Color.fromRGBO(27, 60, 30, 1),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone: ${rsvp['phone']}",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(27, 60, 30, 1).withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Email: ${rsvp['email']}",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(27, 60, 30, 1).withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Option: ${rsvp['option']}",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(27, 60, 30, 1).withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ).animate().fadeIn(duration: 300.ms, delay: (index * 100).ms);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Panel".toUpperCase(),
          style: GoogleFonts.ptSerif(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(27, 60, 30, 1),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            color: const Color(0xFFF6EAEA),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(27, 60, 30, 1).withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child:
              isLoggedIn
                  ? _buildRSVPList()
                  : SingleChildScrollView(
                    child:
                        isWide
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Expanded(child: _buildLoginForm())],
                            )
                            : _buildLoginForm(),
                  ),
        ),
      ),
    );
  }
}
