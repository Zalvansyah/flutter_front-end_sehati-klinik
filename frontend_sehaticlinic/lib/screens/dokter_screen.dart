import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import 'jadwal_screen.dart';

class DokterScreen extends StatelessWidget {
  const DokterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ==== DATA DUMMY POLI & DOKTER ====
    final List<_Poli> polis = [
      _Poli(
        nama: "POLI GIGI",
        doctors: List.generate(
          4,
          (i) => _Doctor(
            nama: "dr. Andi Prasetyo, Sp.PD",
            spesialis: "Dokter Gigi",
            ruangan: "POLI GIGI 1",
            image: "assets/images/dokterr.jpg",
          ),
        ),
      ),
      _Poli(nama: "POLI JANTUNG"),
      _Poli(nama: "POLI GIZI"),
      _Poli(nama: "POLI PSIKOLOGI"),
      _Poli(nama: "POLI KECANTIKAN"),
      _Poli(nama: "POLI ANAK"),
      _Poli(nama: "POLI UMUM"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // --- FIX: currentIndex = 2 (halaman Dokter) + pushReplacement ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xFF0D99FF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          if (i == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          } else if (i == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const JadwalScreen()),
            );
          } else if (i == 2) {
            // sudah di Dokter
            return;
          } else if (i == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Jadwal"),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: "Dokter"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF0D99FF),
        title: const Text(
          "DOKTER",
          style: TextStyle(
            color: Color(0xFF0D99FF),
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView.separated(
        padding: const EdgeInsets.only(bottom: 16),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: polis.length,
        itemBuilder: (context, index) => _PoliTile(poli: polis[index]),
      ),
    );
  }
}

// ====== WIDGET: Header poli + konten dokter ======
class _PoliTile extends StatefulWidget {
  final _Poli poli;
  const _PoliTile({required this.poli});

  @override
  State<_PoliTile> createState() => _PoliTileState();
}

class _PoliTileState extends State<_PoliTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final header = Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B7DBF),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () => setState(() => expanded = !expanded),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.poli.nama,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                expanded ? Icons.arrow_drop_down : Icons.arrow_right,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );

    final content = AnimatedCrossFade(
      crossFadeState:
          expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 220),
      firstChild: (widget.poli.doctors?.isNotEmpty ?? false)
          ? Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: _DoctorsGrid(doctors: widget.poli.doctors!),
            )
          : const SizedBox(height: 0),
      secondChild: const SizedBox(height: 0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header, content],
    );
  }
}

// ====== GRID KARTU DOKTER (2 kolom) ======
class _DoctorsGrid extends StatelessWidget {
  final List<_Doctor> doctors;
  const _DoctorsGrid({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: doctors.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 200,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (_, i) => _DoctorCard(doctor: doctors[i]),
    );
  }
}

// ====== Kartu dokter ======
class _DoctorCard extends StatelessWidget {
  final _Doctor doctor;
  const _DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
        border: Border.all(color: const Color(0xFFE8EEF4)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color(0xFFEFF3F8),
            backgroundImage: AssetImage(doctor.image),
            onBackgroundImageError: (_, __) {},
          ),
          const SizedBox(height: 10),
          Text(
            doctor.nama,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0B7DBF),
              fontWeight: FontWeight.w800,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            doctor.spesialis,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 2),
          Text(
            doctor.ruangan,
            style: const TextStyle(fontSize: 11, color: Color(0xFF0B7DBF)),
          ),
        ],
      ),
    );
  }
}

// ====== Model sederhana ======
class _Poli {
  final String nama;
  final List<_Doctor>? doctors;
  _Poli({required this.nama, this.doctors});
}

class _Doctor {
  final String nama;
  final String spesialis;
  final String ruangan;
  final String image;
  _Doctor({
    required this.nama,
    required this.spesialis,
    required this.ruangan,
    required this.image,
  });
}