import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_baby/colors.dart';
import 'package:my_baby/widgets/labeled_text_form_field.dart';
import 'package:my_baby/widgets/state_counting_back.dart';
import 'package:my_baby/widgets/user_pref_state.dart';
import 'dart:convert';
import 'count_status_screen.dart';

class RenewDataScreen extends StatefulWidget {
  const RenewDataScreen({super.key});

  @override
  State<RenewDataScreen> createState() => _RenewDataScreenState();
}

class _RenewDataScreenState extends State<RenewDataScreen> {
  final nikCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final birthDateCtr = TextEditingController();
  final ageCtr = TextEditingController();
  final bornWeightCtr = TextEditingController();
  final bornHeightCtr = TextEditingController();
  final weightCtr = TextEditingController();
  final heightCtr = TextEditingController();

  List<double> babyData = [];
  List bbuItemJson = [];
  List pbuItemJson = [];
  List bbpbItemJson = [];
  String selectedGender = 'Laki - Laki';
  double genderReloc = -0.217621384157724;
  String statusbbu = '';
  double babyZsbbu = 0;
  String statuspbu = '';
  double babyZspbu = 0;
  String statusbbpb = '';
  double babyZsbbpb = 0;
  int  lalu =0;

  Future<void> readBBUJson() async {
    final String response = await rootBundle.loadString('assets/bbu.json');
    final data = await json.decode(response);
    setState(() {
      bbuItemJson = data["bbu"];
    });
  }

  Future<void> readPBUJson() async {
    final String response = await rootBundle.loadString('assets/pbu.json');
    final data = await json.decode(response);
    setState(() {
      pbuItemJson = data["pbu"];
    });
  }

  Future<void> readBBPBJson() async {
    final String response = await rootBundle.loadString('assets/bbpb.json');
    final data = await json.decode(response);
    setState(() {
      bbpbItemJson = data["bbpb"];
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => readBBUJson());
    WidgetsBinding.instance.addPostFrameCallback((_) => readPBUJson());
    WidgetsBinding.instance.addPostFrameCallback((_) => readBBPBJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Image.asset(
          'assets/logo_biru.png',
          width: 111,
          height: 45,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
              color: CustomColors.secondary,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 31),
            child: ListView(
              children: [
                CustomLabeledTextFormField(
                  label: 'NIK :',
                  controller: nikCtr,
                  hint: 'Masukan NIK Anak',
                  textInputType: TextInputType.number,
                ),
                CustomLabeledTextFormField(
                  label: 'Nama :',
                  controller: nameCtr,
                  hint: 'Masukan Nama Anak',
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomLabeledTextFormField(
                        label: 'Tanggal Lahir :',
                        controller: birthDateCtr,
                        hint: 'Pilih tanggal',
                        readOnly: true,
                        prefixIcon: Icons.calendar_month,
                        onTap: () => _showDatePicker(context),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Jenis Kelamin: '),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio<String>(
                                value: 'Laki - Laki',
                                groupValue: selectedGender,
                                visualDensity: VisualDensity.compact,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedGender = value ?? selectedGender;
                                    genderReloc = (selectedGender == value) ? -0.217621384157724 : 0.290083674673467;
                                  });
                                },
                              ),
                              const Text('Laki - Laki'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Perempuan',
                                groupValue: selectedGender,
                                visualDensity: VisualDensity.compact,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedGender = value ?? selectedGender;
                                    genderReloc = (selectedGender == value) ? 0.290083674673467 : -0.217621384157724;
                                  });
                                },
                              ),
                              const Text('Perempuan'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomLabeledTextFormField(
                        label: 'Umur: ',
                        controller: ageCtr,
                        hint: 'Masukan Umur',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('bulan'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomLabeledTextFormField(
                        label: 'Berat Badan Lahir: ',
                        controller: bornWeightCtr,
                        hint: 'Masukan Berat Badan Saat Lahir',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('kg'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomLabeledTextFormField(
                        label: 'Panjang Badan Lahir: ',
                        controller: bornHeightCtr,
                        hint: 'Masukan Panjang Badan Saat Lahir',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('cm'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomLabeledTextFormField(
                        label: 'Berat Badan: ',
                        controller: weightCtr,
                        hint: 'Masukan Berat Badan Saat Ini',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('kg'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomLabeledTextFormField(
                        label: 'Panjang Badan: ',
                        controller: heightCtr,
                        hint: 'Masukan Panjang Badan Saat Ini',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('cm'),
                  ],
                ),
                const SizedBox(height: 21),
                
                ElevatedButton(
                  onPressed: () async {
                    statusbbu = stateCountBBU(genderReloc ,int.parse(ageCtr.text), double.parse(weightCtr.text), bbuItemJson);
                    babyZsbbu = zscorebbu;
                    statuspbu = stateCountPBU(genderReloc, int.parse(ageCtr.text), double.parse(heightCtr.text), pbuItemJson);
                    babyZspbu = zscorepbu;
                    statusbbpb = stateCountBBPB(genderReloc, double.parse(heightCtr.text), double.parse(weightCtr.text), bbpbItemJson);
                    babyZsbbpb = zscorebbpb;
                    UserPrefState.setDataBayiName(nameCtr.text);
                    UserPrefState.setDataBayiNik(int.parse(nikCtr.text));
                    UserPrefState.setDataBayiUmur(int.parse(ageCtr.text));
                    UserPrefState.setDataBayiBB(double.parse(weightCtr.text));
                    UserPrefState.setDataBayiPB(double.parse(heightCtr.text));
                    Future.delayed(const Duration(seconds: 3),(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountStatusScreen(
                            babyNik: int.parse(nikCtr.text),
                            babyJK: genderReloc,
                            babyAges: int.parse(ageCtr.text),
                            babyBBL: double.parse(bornWeightCtr.text),
                            babyPBL: double.parse(bornHeightCtr.text),
                            babyBBN: double.parse(weightCtr.text),
                            babyPBN: double.parse(heightCtr.text),
                            babySTbbu: statusbbu,
                            babyZSbbu: babyZsbbu,
                            babySTpbu: statuspbu,
                            babyZSpbu: babyZspbu,
                            babySTbbpb: statusbbpb,
                            babyZSbbpb: babyZsbbpb,
                          ),
                        ),);
                    });
                    },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors.primary,
                    ),
                  ),
                  // child: isLoading? const CircularProgressIndicator(color: Colors.white, ): const Text('Hitung Status Gizi'),
                  child: const Text('Hitung Status Gizi'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2200),
    ).then((value) {
      if (value != null) {
        final date = DateFormat('dd/MM/yyyy').format(value);
        birthDateCtr.text = date;
      }
    });
  }
}
