class recomPage {
  final String name;
  final String desc;
  final List<String> pUrl;
  final String listrecom;

  const recomPage ({
    required this.name,
    required this.desc,
    required this.pUrl,
    required this.listrecom,
  });
}

List<recomPage> recom = [
  const recomPage(
    name: 'Susu Biasa',
    desc: 'Susu bayi normal adalah formula yang dirancang khusus untuk memberikan nutrisi lengkap kepada bayi yang tidak memiliki kondisi khusus atau alergi tertentu. Susu bayi normal mengandung campuran karbohidrat, protein, lemak, vitamin, mineral, serta zat-zat penting lainnya yang diperlukan untuk pertumbuhan dan perkembangan bayi dalam rentang usia 0-12 bulan. Formula ini didesain untuk meniru komposisi nutrisi susu ibu sebanyak mungkin, memberikan nutrisi yang optimal untuk pertumbuhan tulang, otak, sistem pencernaan, dan kekebalan bayi.',
    pUrl: [
      'https://i.postimg.cc/Nf5cJCHx/IMG-5088-removebg-preview.png',
      'https://i.postimg.cc/bYbQbDkT/IMG-5089-removebg-preview.png',
      'https://i.postimg.cc/HxdWvkBf/IMG-5092-removebg-preview.png',
      'https://i.postimg.cc/qqjt2vxy/IMG-5120-removebg-preview.png',
    ],
    listrecom: '1. SGM Ananda 1 (0-6bulan) & 2 (6-12bulan) \n2. Morinaga BF 1 \n3. Bebelove 1 (0-6bulan) & 2 (6-12bulan) \n4. Lactogen 1 (0-6bulan) & 2 (6-12bulan)',
  ),
  const recomPage(
    name: 'Susu F100',
    desc: 'Susu bayi F100 adalah jenis susu khusus yang dirancang untuk mengobati kasus malnutrisi akut pada bayi. Susu ini memiliki kandungan nutrisi yang tinggi, terutama protein dan lemak, serta vitamin dan mineral yang penting bagi pemulihan bayi yang mengalami malnutrisi. Penggunaan susu bayi F100 biasanya dilakukan dalam program pemulihan gizi yang diawasi oleh tenaga medis atau ahli gizi, dengan dosis yang disesuaikan sesuai kondisi individu bayi. Tujuan utama dari susu bayi F100 adalah memberikan nutrisi optimal dan mempercepat pemulihan kesehatan bayi yang mengalami malnutrisi akut.',
    pUrl: [
      'https://i.postimg.cc/ZKdk3hL3/IMG-5096-removebg-preview.png'
    ],
    listrecom: 'Diberikan oleh tenaga medis',
  ),
  const recomPage(
    name: 'Susu F75',
    desc: 'Susu bayi F75 adalah susu khusus yang digunakan dalam terapi pemulihan gizi pada bayi dengan malnutrisi akut yang serius. Susu ini dirancang dengan komposisi nutrisi yang mudah dicerna dan diserap oleh tubuh bayi yang lemah. F75 mengandung protein, lemak, karbohidrat, serta vitamin dan mineral penting yang dibutuhkan untuk memulihkan kesehatan bayi. Penggunaan susu bayi F75 harus dilakukan di bawah pengawasan tenaga medis atau ahli gizi yang berpengalaman, dan dosisnya disesuaikan dengan kondisi individu bayi yang sedang dalam proses pemulihan gizi yang serius.',
    pUrl: [
      'https://i.postimg.cc/DfbFQsv8/IMG-5097-removebg-preview.png'
    ],
    listrecom: 'Diberikan oleh tenaga medis',
  ),
  const recomPage(
    name: 'Susu Obese',
    desc: 'Susu obese untuk bayi adalah jenis susu formula yang dirancang khusus untuk membantu mengatur berat badan bayi yang mengalami kelebihan berat. Susu ini memiliki kandungan nutrisi yang terkendali, dengan jumlah energi dan lemak yang lebih rendah dibandingkan dengan susu formula biasa. Tujuan dari susu obese adalah memberikan nutrisi yang cukup untuk pertumbuhan dan perkembangan bayi, sambil mengurangi asupan kalori yang berlebihan. Dengan mengonsumsi susu obese yang tepat, bayi dapat mencapai pertumbuhan yang sehat dan mencapai berat badan yang ideal sesuai dengan usia dan kebutuhannya.',
    pUrl: [
      'https://i.postimg.cc/hjBHrdFN/IMG-5099-removebg-preview.png',
      'https://i.postimg.cc/SNcqWkzX/IMG-5098-removebg-preview.png'
    ],
    listrecom: '1. S-26 Promil Gold \n2. Enfamil A+ GentleCare',
  ),
  const recomPage(
    name: 'Susu Rich-calcium',
    desc: 'Kalsium merupakan salah satu mineral yang mempunyai peranan penting untuk pertumbuhan dan perkembangan anak. Mineral ini bermanfaat untuk mengoptimalkan pertumbuhan tulang, menunjang fungsi saraf dan otot, serta mengurangi risiko terkena penyakit rakitis. Susu tinggi kalsium untuk anak yang dapat membantu mengoptimalkan tumbuh kembangnya.',
    pUrl: [
      'https://i.postimg.cc/SNqdQbCL/IMG-5101-removebg-preview.png',
      'https://i.postimg.cc/KYBWRrqC/IMG-5100-removebg-preview.png'
    ],
    listrecom: '1. Similiac 1 \n2. Frisolac Gold 1',
  ),
  const recomPage(
    name: 'Susu Whey Protein-based',
    desc: 'Susu Whey Protein-based adalah jenis susu formula yang menggunakan whey protein sebagai sumber utama proteinnya. Whey protein merupakan protein yang mudah dicerna oleh bayi dan memiliki profil asam amino yang lengkap. Susu formula ini dirancang untuk memberikan nutrisi yang optimal untuk pertumbuhan dan perkembangan bayi. Whey protein-based formula juga dapat membantu memenuhi kebutuhan protein bayi yang penting untuk pembentukan jaringan tubuh, pertumbuhan otot, dan perkembangan sistem kekebalan tubuh.',
    pUrl: [
      'https://i.postimg.cc/G3XXhhJF/IMG-5094-removebg-preview.png',
      'https://i.postimg.cc/jjh0vwBW/IMG-5090-removebg-preview.png'
    ],
    listrecom: '1. Similiac NeoSure \n2. Nutribaby Royal 1',
  ),

  const recomPage(
    name: 'Susu Soya',
    desc: 'Susu soya untuk bayi adalah jenis susu formula yang dibuat dari kacang kedelai. Susu ini menjadi alternatif bagi bayi yang memiliki alergi atau intoleransi terhadap protein susu sapi. Susu soya mengandung protein nabati yang mudah dicerna oleh tubuh bayi, serta mengandung nutrisi penting seperti karbohidrat, lemak, vitamin, dan mineral yang dibutuhkan untuk pertumbuhan dan perkembangan yang optimal. Susu soya juga biasanya rendah kandungan laktosa, sehingga cocok bagi bayi yang tidak mentolerir laktosa.',
    pUrl: [
      'https://i.postimg.cc/rmvxvT80/98f48ccc-dd9c-4833-9853-5604aac2c44a-removebg-preview.png',
      'https://i.postimg.cc/XNPn6JSD/4zz3zbxe8un155om1-removebg-preview.png',
      'https://i.postimg.cc/cJfSQMrp/s8llgs11z85ib253x-removebg-preview.png'
    ],
    listrecom: '1. SGM Ananda Soya 1 (0-6 bulan) & 2 (6-12 bulan) \n2. Morinaga BMT Soya 1 (0-6 bulan) & 2 (6-12 bulan) \n3. Bebelove Gold Soya 1 (0-6 bulan) & 2 (6-12 bulan)',
  ),

  const recomPage(
    name: 'Susu Hipoalergenik',
    desc: 'Susu hipoalergenik pada bayi adalah jenis susu formula yang dirancang khusus untuk bayi dengan alergi atau intoleransi terhadap protein susu sapi. Susu ini mengandung protein yang telah dihidrolisis atau dipecah menjadi fragmen yang lebih kecil, sehingga lebih mudah dicerna dan dapat membantu mengurangi risiko reaksi alergi pada bayi. Susu hipoalergenik biasanya juga memiliki kandungan karbohidrat dan lemak yang mudah dicerna, serta dilengkapi dengan nutrisi penting lainnya seperti vitamin dan mineral yang dibutuhkan untuk pertumbuhan dan perkembangan bayi secara optimal.',
    pUrl: [
      'https://i.postimg.cc/jqM4spZ1/25225640-cba7-4f63-b66b-794d52375cc8-removebg-preview.png',
      'https://i.postimg.cc/DZJ4nNZ9/fd7fc986-2bca-4040-be14-9982c3e38d3f-removebg-preview.png'
    ],
    listrecom: '1. Neocate LCP \n2. Enfamil Nutramigen LGG',
  ),
];