double zscorebbu = 0;
double zscorepbu = 0;
double zscorebbpb = 0;

String stateCountBBU(double jk,int months, double bb, List bbu) {

  int indexJk = 0;
  int saveIndex = 0;
  String status = '';

  bbu.asMap().forEach((k, v) {
    if(v['kelamin'] == jk) {
      indexJk = k;
    }
  });

  bbu[indexJk]['keterangan'].asMap().forEach((i, x) {
    if(x['Bulan'] == months) {
      saveIndex = x['Bulan'];
    }
  });

  if(bb<bbu[indexJk]['keterangan'][saveIndex]['Median']){
    zscorebbu = ((bb-(bbu[indexJk]['keterangan'][saveIndex]['Median']))/((bbu[indexJk]['keterangan'][saveIndex]['Median'])-(bbu[indexJk]['keterangan'][saveIndex]['-1 SD'])))+(-0.347540244);
  } else {
    zscorebbu = ((bb-(bbu[indexJk]['keterangan'][saveIndex]['Median']))/((bbu[indexJk]['keterangan'][saveIndex]['+1 SD'])-(bbu[indexJk]['keterangan'][saveIndex]['Median'])))+(-0.347540244);
  }

  if(zscorebbu < -3) { status = 'SANGAT KURANG'; }
  if(-3 <= zscorebbu && zscorebbu < -2) { status = 'KURANG'; }
  if(-2 <= zscorebbu && zscorebbu <= 1) { status = 'NORMAL'; }
  if(zscorebbu > 1) { status = 'RISIKO LEBIH'; }

  return status;
}

String stateCountPBU(double jk, int months, double pb, List pbu) {

  int indexJk = 0;
  int saveIndex = 0;
  String status = '';

  pbu.asMap().forEach((k, v) {
    if(v['kelamin'] == jk) {
      indexJk = k;
    }
  });

  pbu[indexJk]['keterangan'].asMap().forEach((i, x) {
    if(x['Bulan'] == months) {
      saveIndex = x['Bulan'];
    }
  });

  if(pb<pbu[indexJk]['keterangan'][saveIndex]['Median']){
    zscorepbu = (((pb-0.7)-(pbu[indexJk]['keterangan'][saveIndex]['Median']))/((pbu[indexJk]['keterangan'][saveIndex]['Median'])-(pbu[indexJk]['keterangan'][saveIndex]['-1 SD'])))+(-0.48654514);
  } else {
    zscorepbu = (((pb-0.7)-(pbu[indexJk]['keterangan'][saveIndex]['Median']))/((pbu[indexJk]['keterangan'][saveIndex]['+1 SD'])-(pbu[indexJk]['keterangan'][saveIndex]['Median'])))+(-0.48654514);
  }

  if(zscorepbu < -3) { status = 'SANGAT PENDEK'; }
  if(-3 <= zscorepbu && zscorepbu < -2) { status = 'PENDEK'; }
  if(-2 <= zscorepbu && zscorepbu <= 3) { status = 'NORMAL'; }
  if(zscorepbu > 3) { status = 'TINGGI'; }

  return status;
}

String stateCountBBPB(double jk, double pb, double bb, bbpb) {

  int indexJk = 0;
  int saveIndex = -1;
  String status = '';

  bbpb.asMap().forEach((k, v) {
    if(v['kelamin'] == jk) {
      indexJk = k;
    }
  });

  bbpb[indexJk]['keterangan'].asMap().forEach((i, x) {
      if(x['Panjang Badan'] <= pb) {
        saveIndex = i;
      }
  });

  if(saveIndex >= 0) {
    saveIndex = saveIndex;
  }

  if(bb<bbpb[indexJk]['keterangan'][saveIndex]['Median']){
    zscorebbpb = ((bb-(bbpb[indexJk]['keterangan'][saveIndex]['Median']))/((bbpb[indexJk]['keterangan'][saveIndex]['Median'])-(bbpb[indexJk]['keterangan'][saveIndex]['-1 SD'])))+(-0.11646292);
  } else {
    zscorebbpb = ((bb-(bbpb[indexJk]['keterangan'][saveIndex]['Median']))/((bbpb[indexJk]['keterangan'][saveIndex]['+1 SD'])-(bbpb[indexJk]['keterangan'][saveIndex]['Median'])))+(-0.11646292);
  }

  if(zscorebbpb < -3) { status = 'GIZI BURUK'; }
  if(-3 <= zscorebbpb && zscorebbpb < -2) { status = 'GIZI KURANG'; }
  if(-2 <= zscorebbpb && zscorebbpb <= 1) { status = 'GIZI BAIK'; }
  if(1 < zscorebbpb && zscorebbpb <= 2) { status = 'RISIKO GIZI LEBIH'; }
  if(2 < zscorebbpb && zscorebbpb <= 3) { status = 'GIZI LEBIH'; }
  if(zscorebbpb > 3) { status = 'OBESITAS'; }

  return status;
}