class CharityData {
  String title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;
  double progress;
  String? uang;
  int likes;
  int donatedAmount;

  CharityData(
    this.title,
    this.author,
    this.content,
    this.urlToImage,
    this.date,
    this.progress,
    this.uang,
    this.likes,
    this.donatedAmount,
  );

  static List<CharityData> breakingNewsData = [
    CharityData(
        "Program Sosial Untuk Bantuan Medis",
        "insanberbagi",
        "bisa",
        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fgudang-prod.imgix.net%2Fimages%2F5799bf28-2aa8-11ee-adf9-e6895af0855b_90CFAE6217E0D87D.png%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
        "2022-10-10",
        80,
        "Rp 8.000.000/ 10.000.000",
        0,
        0),
    CharityData(
        "Zakat Yayasan Dana Sosial Al Falah",
        "insanberbagi",
        "bisa",
        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fimgix.kitabisa.com%2Fd16cf528-06b0-447c-b2cb-54cde4a07922.jpg%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
        "2024-10-10",
        80,
        "Rp 8.000.000/ 10.000.000",
        0,
        0),
    CharityData(
        "Donasi sosial kepada Anak-Anak Yatim",
        "insanberbagi",
        "bisa",
        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fimgix.kitabisa.com%2F616ed43b-eadd-4dd2-8a3f-94e5e2383308.jpg%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
        "2024-10-10",
        80,
        "Rp 8.000.000/ 10.000.000",
        0,
        0)
  ];

  static List<CharityData> recentNewsData = [
    CharityData(
        "Program Sosial Untuk Bantuan Medis",
        "insanberbagi",
        "bisa",
        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fgudang-prod.imgix.net%2Fimages%2F5799bf28-2aa8-11ee-adf9-e6895af0855b_90CFAE6217E0D87D.png%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
        "2022-10-10",
        80,
        "Rp 8.000.000/ 10.000.000",
        0,
        0),
    CharityData(
        "Zakat Yayasan Dana Sosial Al Falah",
        "insanberbagi",
        "bisa",
        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fimgix.kitabisa.com%2Fd16cf528-06b0-447c-b2cb-54cde4a07922.jpg%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
        "2024-10-10",
        80,
        "Rp 8.000.000/ 10.000.000",
        0,
        0),
    CharityData(
        "Donasi sosial kepada Anak-Anak Yatim",
        "insanberbagi",
        "bisa",
        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fimgix.kitabisa.com%2F616ed43b-eadd-4dd2-8a3f-94e5e2383308.jpg%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
        "2024-10-10",
        80,
        "Rp 8.000.000/ 10.000.000",
        0,
        5)
  ];
}
