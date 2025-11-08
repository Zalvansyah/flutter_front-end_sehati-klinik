import 'package:flutter/material.dart';
import 'jadwal_screen.dart';
import 'profile_screen.dart';
import 'dokter_screen.dart';


// ini home cuy
class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
String selectedFilter = 'All';

@override
Widget build(BuildContext context) {
  final List<Map<String, String>> appointments = [
    {
      "name": "Dr. Evan Kurnniawan",
      "speciality": "Konsultasi Lambung",
      "date": "Senin, 26 July",
      "time": "09.00 - 10.00",
      "image": "assets/images/dokterr.jpg"
    },
    {
      "name": "Dr. Agus Setiawan",
      "speciality": "Pemeriksaan Umum",
      "date": "Rabu, 28 July",
      "time": "14.00 - 15.00",
      "image": "assets/images/dokterr.jpg"
    },
    {
      "name": "Dr. Clara Wijaya",
      "speciality": "Psikolog Anak",
      "date": "Kamis, 29 July",
      "time": "10.30 - 11.30",
      "image": "assets/images/dokterr.jpg"
    },
  ];
  final appts = appointments.take(2).toList();

  final List<Map<String, String>> doctors = List.generate(10, (index) {
    final names = [
      "Dr. Evan Kurnniawan",
      "Dr. Agus Setiawan",
      "Dr. Clara Wijaya",
      "Dr. Rian Nugraha",
      "Dr. Indah Permatasari",
      "Dr. Budi Santoso",
      "Dr. Laila Fadhilah",
      "Dr. Ahmad Rizal",
      "Dr. Dita Putri",
      "Dr. Wira Anggara"
    ];
    final specialties = [
      "Dentist",
      "Dermatologist",
      "Neurologist",
      "Pediatrician",
      "Cardiologist",
      "ENT Specialist",
      "General Doctor",
      "Orthopedic",
      "Psychiatrist",
      "Gynecologist"
    ];
    return {
      "name": names[index],
      "speciality": specialties[index],
      "experience": "${3 + index} Tahun",
      "image": "assets/images/dokterr.jpg"
    };
  });

  final List<Map<String, String>> filteredDoctors = selectedFilter == 'All'
      ? doctors
      : doctors.where((d) => d['speciality'] == selectedFilter).toList();

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),

    // ini navbar cuy
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: const Color(0xFF0D99FF),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (i) {
        if (i == 1) {
          Navigator.push(context,
            MaterialPageRoute(builder: (_) => const JadwalScreen()),
          );
        } else if (i == 2) { // ← item “Dokter”
          Navigator.push(context,
            MaterialPageRoute(builder: (_) => const DokterScreen()),
          );
        } else if (i == 3) {
          Navigator.push(context,
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


    body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF0D99FF)),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "M. Zacky Alvansyah",
                            style: TextStyle(
                              color: Color(0xFF002C47),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Depok, Indonesia",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0D99FF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F3FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.notifications_none, color: Color(0xFF0D99FF)),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // CARD ANTRIAN & AMBULANCE
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D99FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.people, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text(
                                "Antrian Saat Ini  :  #10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text(
                                "Perkiraan Waktu : 09.00 PM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Memanggil Ambulance...")),
                        );
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D99FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: Colors.white, size: 22),
                              SizedBox(height: 4),
                              Text(
                                "Ambulance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // SEARCH
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F5F9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Cari dokter atau lainnya di sini!",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // KATEGORI DOKTER
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _categoryButton("Dokter Gigi", Icons.calendar_today)),
                      const SizedBox(width: 12),
                      Expanded(child: _categoryButton("Dokter Mata", Icons.remove_red_eye)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _categoryButton("Dokter Saraf", Icons.psychology)),
                      const SizedBox(width: 12),
                      Expanded(child: _categoryButton("Dokter Anak", Icons.child_care)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // PERTEMUAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Pertemuan yang akan datang",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF002C47),
                    ),
                  ),
                  Text(
                    "Lihat semua",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0D99FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  itemCount: appts.length,
                  itemBuilder: (context, index) {
                    final item = appts[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D99FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white.withOpacity(0.3),
                            backgroundImage: AssetImage(item["image"]!),
                            onBackgroundImageError: (_, __) =>
                                debugPrint("Gagal memuat ${item["image"]}"),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item["name"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  item["speciality"]!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today,
                                        size: 14, color: Colors.white),
                                    const SizedBox(width: 6),
                                    Text(item["date"]!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.access_time,
                                        size: 14, color: Colors.white),
                                    const SizedBox(width: 6),
                                    Text(item["time"]!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              // TEMUKAN DOKTER
              const Text(
                "Temukan dokter anda!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002C47),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _filterChip("All"),
                    const SizedBox(width: 8),
                    _filterChip("Dentist"),
                    const SizedBox(width: 8),
                    _filterChip("Dermatologist"),
                    const SizedBox(width: 8),
                    _filterChip("Cardiologist"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // LIST DOKTER 
              Column(
                children: filteredDoctors.map((doc) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(doc["image"]!),
                          onBackgroundImageError: (_, __) =>
                              debugPrint("⚠️ Gagal memuat ${doc["image"]}"),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doc["name"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF002C47),
                                ),
                              ),
                              Text(
                                doc["speciality"]!,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 13),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  _experienceTag(doc["experience"]!),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _filterChip(String label) {
  final active = selectedFilter == label;
  return GestureDetector(
    onTap: () => setState(() => selectedFilter = label),
    child: _filterTag(label, active),
  );
}


static Widget _categoryButton(String title, IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: const Color(0xFFE6F3FF),
      borderRadius: BorderRadius.circular(12),
    ),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF0D99FF), size: 18),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF002C47),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

static Widget _filterTag(String label, bool active) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: active ? const Color(0xFFE6F3FF) : Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: active ? const Color(0xFF0D99FF) : Colors.grey.shade400,
      ),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: active ? const Color(0xFF0D99FF) : Colors.black87,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

static Widget _experienceTag(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: const BoxDecoration(
      color: Color(0xFFF2F5F9),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Row(
      children: [
        const Icon(Icons.badge, color: Colors.grey, size: 14),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    ),
  );
}
}