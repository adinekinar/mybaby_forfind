import 'package:flutter/material.dart';
import 'package:my_baby/renew_data_screen.dart';

import 'colors.dart';

class MilkNotSuitableScreen extends StatelessWidget {
  const MilkNotSuitableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_homepage.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Image.asset(
                  'assets/logo_putih.png',
                  width: 111,
                  height: 45,
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(17, 80, 17, 0),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.75),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: 'Kriteria Susu dengan Rekomendasi ',
                              style: TextStyle(
                                  color: CustomColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'Belum Sesuai',
                                  style: TextStyle(
                                      color: Color(0xffED5A6B),
                                      decoration: TextDecoration.underline),
                                )
                              ]),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Sayang sekali Bunda masih belum bisa membeli susu tersebut.\n\nDi karenakan masih belum tertera kesesuaian antara kandungan susu dengan jenis susu yang telah direkomendasikan.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 75),
                        const Text(
                          'Klik manapun untuk kembali ke beranda',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff969696),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/done.png',
                        width: 160,
                        height: 160,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
