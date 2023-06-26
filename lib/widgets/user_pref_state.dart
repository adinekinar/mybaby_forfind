import 'package:shared_preferences/shared_preferences.dart';

class UserPrefState {
  static late SharedPreferences _preferences;

  static const _keyName = 'name';
  static const _keyNIK = 'nik';
  static const _keyUmur = 'umur';
  static const _keyBB = 'beratbadan';
  static const _keyPB = 'panjangbadan';

  static const _keyRecom = 'jenissusu';
  static const _keybbu = 'statusbbu';
  static const _keypbu = 'statuspbu';
  static const _keybbpb = 'statusbbpb';
  static const _keyIndex = 'index';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setDataBayiName (String name) async {
    await _preferences.setString(_keyName, name);
  }

  static String? getDataBayiName() =>
    _preferences.getString(_keyName);

  static Future setDataBayiNik (int nik) async {
    await _preferences.setInt(_keyNIK, nik);
  }

  static int? getDataBayiNik() =>
    _preferences.getInt(_keyNIK);

  static Future setDataBayiUmur (int umur) async {
    await _preferences.setInt(_keyUmur, umur);
  }

  static int? getDataBayiUmur() =>
    _preferences.getInt(_keyUmur);

  static Future setDataBayiBB (double bb) async {
    await _preferences.setDouble(_keyBB, bb);
  }

  static double? getDataBayiBB() =>
    _preferences.getDouble(_keyBB);

  static Future setDataBayiPB (double pb) async {
    await _preferences.setDouble(_keyPB, pb);
  }

  static double? getDataBayiPB() =>
    _preferences.getDouble(_keyPB);

  static Future setRekomendasiSusu (String jenis) async {
    await _preferences.setString(_keyRecom, jenis);
  }

  static String? getRekomendasiSusu() =>
      _preferences.getString(_keyRecom);

  static Future setRekomendasiBBU (String bbu) async {
    await _preferences.setString(_keybbu, bbu);
  }

  static String? getRekomendasiBBU() =>
      _preferences.getString(_keybbu);

  static Future setRekomendasiPBU (String pbu) async {
    await _preferences.setString(_keypbu, pbu);
  }

  static String? getRekomendasiPBU() =>
      _preferences.getString(_keypbu);

  static Future setRekomendasiBBPB (String bbpb) async {
    await _preferences.setString(_keybbpb, bbpb);
  }

  static String? getRekomendasiBBPB() =>
      _preferences.getString(_keybbpb);

  static Future setIndexRekomendasi (int indexny) async {
    await _preferences.setInt(_keyIndex, indexny);
  }

  static int? getIndexRekomendasi() =>
      _preferences.getInt(_keyIndex);
}