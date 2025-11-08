import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Konsultasi Medis Kini Lebih Mudah",
      "desc":
          "Pesan janji temu, konsultasi, dan akses informasi kesehatan langsung dari aplikasi—tanpa antre panjang di klinik.",
      "image": "assets/images/splash1.png"
    },
    {
      "title": "Didukung Tenaga Medis Terpercaya",
      "desc":
          "Setiap dokter dan perawat kami berdedikasi memberikan pelayanan terbaik dengan standar medis terkini.",
      "image": "assets/images/splash2.png"
    },
    {
      "title": "Perawatan Terbaik untuk Keluarga Anda",
      "desc":
          "Kami hadir memberikan layanan kesehatan menyeluruh untuk Anda dan orang tercinta, dengan dokter profesional dan pelayanan ramah.",
      "image": "assets/images/splash3.png"
    },
  ];

  void nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  //SKIP FUNCTION
  void skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            
            PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: skip,
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF0D99FF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Skip"),
                        ),
                      ),

                      const Spacer(),

                      Text(
                        onboardingData[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002C47),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Image.asset(
                        onboardingData[index]["image"]!,
                        height: 230,
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          onboardingData[index]["desc"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),

                      const Spacer(flex: 2),
                    ],
                  ),
                );
              },
            ),

            // Indikator
            Positioned(
              left: 30,
              bottom: 35,
              child: Row(
                children: List.generate(
                  onboardingData.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage == i ? 10 : 8,
                    height: _currentPage == i ? 10 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == i
                          ? const Color(0xFF002C47)
                          : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

            // tombol next 
            Positioned(
              right: 0,
              bottom: -10,
              child: GestureDetector(
                onTap: nextPage,
                child: Container(
                  width: 180,
                  height: 90,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0D99FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: const Text(
                    "Next →",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
