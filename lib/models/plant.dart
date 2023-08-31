class Plants {
  final int id;
  final String name;
  final String pride;
  final String price;
  final String type;
  final String assetImage;
  final String description;
  final double height;
  final double humidity;
  final double width;
  final bool? isRecommended;
  final bool? isTop;
  final bool? isIndoor;
  final bool? isOutdoor;

  Plants({
    required this.price,
    required this.id,
    required this.name,
    required this.pride,
    required this.type,
    required this.assetImage,
    required this.description,
    required this.height,
    required this.humidity,
    required this.width,
    this.isRecommended,
    this.isTop,
    this.isIndoor,
    this.isOutdoor,
  });

  factory Plants.fromJson(Map<String, dynamic> json) {
    return Plants(
      id: json['id'],
      name: json['name'],
      pride: json['pride'],
      price: json['price'],
      type: json['type'],
      assetImage: json['assetImage'],
      description: json['description'],
      height: json['height'],
      humidity: json['humidity'],
      width: json['width'],
      isRecommended: json['isRecommended'],
      isTop: json['isTop'],
      isIndoor: json['isIndoor'],
      isOutdoor: json['isOutdoor'],
    );
  }
}
