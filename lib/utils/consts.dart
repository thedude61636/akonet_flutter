class Links {
  static const String BASE_URL = "http://www.akonet.info/";
  static const String API_URL = BASE_URL + "index.php/";
  static const String IMAGE_BASE_URL = BASE_URL + "images/isp/";

  static String dailyDowntimeStats(String ispId) => API_URL + "stats/daily/$ispId";
  static String hourlyDowntimeStats(String ispId) => API_URL + "stats/hourly/$ispId";
  static String hourlyLossStats(String ispId) => API_URL + "stats/loss/hourly/$ispId";

}
