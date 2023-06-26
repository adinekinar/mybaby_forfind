import 'package:flutter/material.dart';
import 'package:my_baby/recommendation_screen.dart';
import 'package:my_baby/renew_data_screen.dart';
import 'package:my_baby/widgets/user_pref_state.dart';

import 'colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  int nik = 0;
  int umur = 0;
  double bb = 0;
  double pb = 0;

  String jenis = '';
  String bbu = '';
  String pbu = '';
  String bbpb = '';
  int index_susu = 0;

  @override
  void initState() {
    super.initState();
    name = UserPrefState.getDataBayiName() ?? '';
    nik = UserPrefState.getDataBayiNik() ?? 0;
    umur = UserPrefState.getDataBayiUmur() ?? 0;
    bb = UserPrefState.getDataBayiBB() ?? 0;
    pb = UserPrefState.getDataBayiPB() ?? 0;

    jenis = UserPrefState.getRekomendasiSusu() ?? '';
    bbu = UserPrefState.getRekomendasiBBU() ?? '';
    pbu = UserPrefState.getRekomendasiPBU() ?? '';
    bbpb = UserPrefState.getRekomendasiBBPB() ?? '';
    index_susu = UserPrefState.getIndexRekomendasi() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg_homepage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Image.asset(
                  'assets/logo_putih.png',
                  width: 111,
                  height: 45,
                ),
                const SizedBox(height: 32),
                _buildHeader(context),
                const SizedBox(height: 23),
                _buildBody(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingin bayi sehat?\nPilih susu formula yang sesuai',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  'assets/bayi.png',
                  height: 76,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RenewDataScreen(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 76),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(22),
                  child: Row(
                    children: [
                      Icon(Icons.qr_code_scanner, size: 35,),
                      SizedBox(width: 18),
                      Text('Dapatkan rekomendasi \nsusu yang sesuai!')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 25, 12, 0),
            child: Text(
              'Riwayat Data',
              style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Text(
              'Data Bayi',
              style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          _buildCardItem(
            header: name,
            text1: nik.toString(),
            text2: '$umur Bulan',
            text3: 'BB $bb kg',
            text4: 'TB $pb cm',
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Text(
              'Rekomendasi Susu',
              style: TextStyle(
                  color: CustomColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          GestureDetector(
            onTap: (jenis == '')?(){}: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RecommendationScreen(index: index_susu))),
            child: _buildCardItem(
              header: jenis,
              text1: 'Status gizi:',
              text2: 'BB/U $bbu',
              text3: 'TB/U $pbu',
              text4: 'BB/TB $bbpb',
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _buildCardItem({
    required String header,
    required String text1,
    required String text2,
    required String text3,
    required String text4,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              text1,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColors.grey,
              ),
            ),
            Text(
              text2,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColors.grey,
              ),
            ),
            Text(
              text3,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColors.grey,
              ),
            ),Text(
              text4,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
