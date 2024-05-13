
class NewsData{
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;
  double progress;


NewsData(
  this.title,
  this.author,
  this.content,
  this.urlToImage,
  this.date,
  this.progress
);


static List<NewsData> breakingNewsData =[
  NewsData(
  "Dunia Makin Panas, Presiden Iran Ancam Musnahkan Israel",
  "CNBC Indonesia",
  "CNBC Indonesia", 
  "https://awsimages.detik.net.id/visual/2024/04/02/presiden-iran-ebrahim-raisi-apebrahim-noroozi_169.jpeg?w=715&q=90", 
  "2024-04-24",
  80),

  NewsData(
  "Peringatan Muncul dari PBB Buat Asia, Gambarkan RI dalam Bahaya",
  "CNBC Indonesia", 
  "CNBC Indonesia", 
  "https://awsimages.detik.net.id/visual/2024/04/24/tingkat-permukaan-laut-meningkat-lebih-cepat-daripada-rata-rata-global-di-banyak-wilayah-asia-wmo-dok-pbb-1_169.jpeg?w=715&q=90", 
  "2024-10-10",
  80),

   NewsData(
  "Eropa Mulai Kena Getahnya, AS Ikut RI Protes UU Anti Deforestasi",
  "CNBC Indonesia", 
  "CNBC Indonesia", 
  "https://awsimages.detik.net.id/visual/2023/04/11/bendera-as_169.jpeg?w=715&q=90", 
  "2024-10-10",
  80)
];

static List<NewsData> recentNewsData =[
  NewsData(
  "Jenis-jenis Kelompok Sosial Tidak Teratur",
  "Tim Redaksi",
  "Tim Redaksi", 
  "https://asset.kompas.com/crops/-IhS8m1TtP5STVGggyW-BvU5S5I=/0x40:1440x1000/750x500/data/photo/2024/04/23/66276e065878c.png", 
  "2024-04-21",
  80),

  NewsData(
  "4 Faktor Pendorong Interaksi Sosial",
  "Tim Redaksi",
  "Tim Redaksi", 
  "https://asset.kompas.com/crops/jvpKhCDC9Z0qEpKqLaYjbDbese0=/0x19:1440x979/750x500/data/photo/2024/04/23/66276867f2ca4.png", 
  "2024-04-24",
  80),
    NewsData(
  "Proses Terjadinya Hubungan Sosial Secara Asosiatif",
  "Fomalhaut", 
  "Nito", 
  "https://asset.kompas.com/crops/92XGi0d_kJVBT5TSZm6-0tGRfFc=/0x64:1440x1024/750x500/data/photo/2024/04/22/6625f89bd3457.png", 
  "2024-09-09",
  80),
];
}