class Device {
  int? id;
  String? brand;
  String? model;
  String? token;

  Device({
    this.id,
    required this.brand,
    required this.model,
    required this.token
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      token: json['token'],
    );
  }
}