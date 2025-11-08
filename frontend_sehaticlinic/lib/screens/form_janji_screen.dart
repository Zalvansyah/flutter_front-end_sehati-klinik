import 'package:flutter/material.dart';
import 'payment_method_screen.dart';

class FormJanjiScreen extends StatefulWidget {
  const FormJanjiScreen({super.key});

  @override
  State<FormJanjiScreen> createState() => _FormJanjiScreenState();
}

class _FormJanjiScreenState extends State<FormJanjiScreen> {
  final TextEditingController tglC = TextEditingController();
  final TextEditingController nikC = TextEditingController();
  final TextEditingController bpjsC = TextEditingController();
  final TextEditingController refC = TextEditingController();

  Future<void> pickDate() async {
    final now = DateTime.now();
    final res = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (res != null) {
      tglC.text = "${res.day.toString().padLeft(2, '0')}-${res.month.toString().padLeft(2, '0')}-${res.year}";
      setState(() {});
    }
  }

  InputDecoration deco(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF7AAED1)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF0B7DBF), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF0B7DBF), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  void _showSummary() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 28),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "M. Zacky Alvansyah",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF0B7DBF)),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "29 Oktober 2025",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Color(0xFFE1EEF6)),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "dr. Andi Prasetyo, Sp.PD",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF0B7DBF)),
                    ),
                    SizedBox(height: 2),
                    Text("SIP–2011/GG/2024", style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Sesi : Pagi", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF0B7DBF))),
                    SizedBox(height: 4),
                    Text("Rabu, 29 Oktober2025", style: TextStyle(fontSize: 12, color: Colors.black87)),
                    Text("08:00:00 s/d 10:00:00", style: TextStyle(fontSize: 12, color: Colors.black87)),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Color(0xFFE1EEF6)),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rincian Pembayaran",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: const Color(0xFF0B7DBF)),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Expanded(child: Text("Tarif Konsultasi Dokter", style: TextStyle(fontSize: 12))),
                    Text("Rp 50.000", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Expanded(child: Text("Biaya Administrasi", style: TextStyle(fontSize: 12))),
                    Text("Rp 5.000", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Expanded(
                      child: Text("Total", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
                    ),
                    Text("Rp 55.000", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PaymentMethodScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B7DBF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Pilih Metode Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Pendaftaran Pemeriksaan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0B7DBF),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF0B7DBF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: const Text(
                "Mohon lengkapi profil Anda agar dapat\nterhubung dengan berbagai layanan",
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tanggal Lahir", style: TextStyle(color: Color(0xFF0B7DBF), fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: tglC,
                      readOnly: true,
                      decoration: deco("Tanggal Lahir").copyWith(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month, color: Color(0xFF0B7DBF)),
                          onPressed: pickDate,
                        ),
                      ),
                      onTap: pickDate,
                    ),
                    const SizedBox(height: 16),
                    const Text("NIK", style: TextStyle(color: Color(0xFF0B7DBF), fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(controller: nikC, keyboardType: TextInputType.number, decoration: deco("NIK")),
                    const SizedBox(height: 16),
                    const Text("Nomor BPJS (tidak wajib)", style: TextStyle(color: Color(0xFF0B7DBF), fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(controller: bpjsC, keyboardType: TextInputType.number, decoration: deco("Nomor BPJS")),
                    const SizedBox(height: 16),
                    const Text("Kode Referral (tidak wajib)", style: TextStyle(color: Color(0xFF0B7DBF), fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextField(controller: refC, decoration: deco("Kode Referral")),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _showSummary,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B7DBF),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 6,
                          shadowColor: const Color(0xFF0B7DBF).withOpacity(.35),
                        ),
                        child: const Text("Simpan & Lanjutkan", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
