class Constant {
  static const String host = "64.227.126.121";
  static const String baseUrl = "http://$host:8080/api";
  static const String baseUrlWs = "ws://$host:8080/api/ws";
  static const String refresh_dashboard_topic = "/topic/admin/dashboard/refresh";
  static const String refresh_precanceled_orders_count_topic = "/topic/admin/precanceled/orders/numbers/refresh";
  static const String ImageUrl = baseUrl + "/media/";
  static const String OWNER = "OWNER";
  static const String MANAGER = "MANAGER";
  static const String WAITER = "WAITER";
  static const String BARMAN = "BARMAN";
}
