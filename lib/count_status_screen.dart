import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_baby/recommendation_screen.dart';
import 'package:my_baby/widgets/labeled_text_form_field.dart';
import 'package:my_baby/widgets/recomendation.dart';
import 'package:my_baby/widgets/user_pref_state.dart';

import 'colors.dart';

const List<String> dropdown = <String>['Soya/Kacang', 'Susu sapi', 'Tidak Alergi'];

class CountStatusScreen extends StatefulWidget {
  const CountStatusScreen({Key? key,
    required this.babyNik,
    required this.babyJK,
    required this.babyAges,
    required this.babyBBL,
    required this.babyPBL,
    required this.babyBBN,
    required this.babyPBN,
    required this.babySTbbu,
    required this.babySTpbu,
    required this.babySTbbpb,
    required this.babyZSbbu,
    required this.babyZSpbu,
    required this.babyZSbbpb

  }):super(key: key);
  final int babyNik;
  final double babyJK;
  final int babyAges;
  final double babyBBL;
  final double babyPBL;
  final double babyBBN;
  final double babyPBN;
  final String babySTbbu;
  final String babySTpbu;
  final String babySTbbpb;
  final double babyZSbbu;
  final double babyZSpbu;
  final double babyZSbbpb;

  @override
  State<CountStatusScreen> createState() => _CountStatusScreenState();
}

class _CountStatusScreenState extends State<CountStatusScreen> {
  final weightCtr = TextEditingController();
  final heightCtr = TextEditingController();
  final weightBasedOnHeightCtr = TextEditingController();
  final alergyCtr = TextEditingController();
  final apiURL = "https://xgboost-api-deta.et.r.appspot.com/";

  String dropvalue = dropdown.first;

  double bbu = 0.415582993737842;
  double pbu = 1.04691846000883;
  double bbpb = 0.506734331221536;

  String state_bbu = '';
  String state_pbu = '';
  String state_bbpb = '';
  String state_recom = '';

  int resultRecom = 0;

  final Map<String, dynamic> theData = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      weightCtr.text = widget.babySTbbu;
      heightCtr.text = widget.babySTpbu;
      weightBasedOnHeightCtr.text = widget.babySTbbpb;
    });
  }

  void postModel() async {
    try {
      final response = await post(Uri.parse(apiURL), body: json.encode(theData), headers: {'Content-type': 'application/json'});
      resultRecom = int.parse(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      switch(weightCtr.text){
        case 'KURANG':
          bbu = -5.66730426605379;
          break;
        case 'RISIKO LEBIH':
          bbu = 0.0281099589318932;
          break;
        case 'SANGAT KURANG':
          bbu = -4.94430412234416;
          break;
        default:
          bbu = 0.415582993737842;
      }

      switch(heightCtr.text){
        case 'PENDEK':
          pbu = -7.09324345852092;
          break;
        case 'SANGAT PENDEK':
          pbu = -5.59093128726921;
          break;
        case 'TINGGI':
          pbu = 0.0185405079157427;
          break;
        default:
          pbu = 1.04691846000883;
      }

      switch(weightBasedOnHeightCtr.text){
        case 'GIZI KURANG':
          bbpb = -5.85451580814193;
          break;
        case 'GIZI LEBIH':
          bbpb = -1.47377204728094;
          break;
        case 'RISIKO GIZI LEBIH':
          bbpb = 0.323642905859412;
          break;
        case 'GIZI BURUK':
          bbpb = -4.44352883443167;
          break;
        case 'OBESITAS':
          bbpb = -5.08538272060407;
          break;
        default:
          bbpb = 0.506734331221536;
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          height: 600,
          decoration: BoxDecoration(
              color: CustomColors.secondary,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 31),
            child: ListView(
              children: [
                CustomLabeledTextFormField(
                  label: 'Berat Badan berdasarkan Umur: ',
                  controller: weightCtr,
                  readOnly: true,
                ),
                CustomLabeledTextFormField(
                  label: 'Panjang Badan berdasarkan Umur: ',
                  controller: heightCtr,
                  readOnly: true,
                ),
                CustomLabeledTextFormField(
                  label: 'Berat Badan berdasarkan Tinggi Badan: ',
                  controller: weightBasedOnHeightCtr,
                  readOnly: true,
                ),
                // CustomLabeledTextFormField(
                //   label: 'Alergi: ',
                //   controller: alergyCtr,
                //   hint: 'Masukan Alergi',
                // ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  hint: const Text('Pilih Alergi'),
                  dropdownColor: Colors.white,
                  onChanged: (String? value) {
                    setState(() {
                      dropvalue = value!;
                    });
                  },
                  items: dropdown.map<DropdownMenuItem<String>>((String val){
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 21),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors.primary,
                    ),
                  ),
                  onPressed: () async {
                    theData["nik"] = widget.babyNik;
                    theData["jk"] = widget.babyJK;
                    theData["bbl"] = widget.babyBBL;
                    theData["pbl"] = widget.babyPBL;
                    theData["bb"] = widget.babyBBN;
                    theData["pb"] = widget.babyPBN;
                    theData["umur"] = widget.babyAges;
                    theData["bbu"] = bbu;
                    theData["zsbbu"] = widget.babyZSbbu;
                    theData["pbu"] = pbu;
                    theData["zspbu"] = widget.babyZSpbu;
                    theData["bbpb"] = bbpb;
                    theData["zsbbpb"] = widget.babyZSbbpb;
                    postModel();
                    print(widget.babyZSpbu);
                    print(widget.babyZSbbu);
                    print(widget.babyZSbbpb);
                    UserPrefState.setRekomendasiBBU(weightCtr.text);
                    UserPrefState.setRekomendasiPBU(heightCtr.text);
                    UserPrefState.setRekomendasiBBPB(weightBasedOnHeightCtr.text);
                    Future.delayed(Duration(seconds: 5), (){
                      alergicFunc();
                      print(resultRecom);
                      UserPrefState.setRekomendasiSusu(recom[resultRecom].name);
                      UserPrefState.setIndexRekomendasi(resultRecom);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              RecommendationScreen(index: resultRecom)
                          )
                      );
                    });
                  },
                  child: const Text('Rekomendasikan'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  alergicFunc () {
    if (dropvalue == 'Soya/Kacang' && (resultRecom != 1 || resultRecom != 2)) {
      resultRecom = 6;
    } else {
      resultRecom = resultRecom;
    }
    if (dropvalue == 'Susu sapi' && (resultRecom != 1 || resultRecom != 2)) {
      resultRecom = 7;
    } else {
      resultRecom = resultRecom;
    }
    if (dropvalue == 'Tidak Alergi') {
      resultRecom = resultRecom;
    }
  }
}
