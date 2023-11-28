import 'images.dart';

class GifsItem {
  final String id;
  final Images images;
  final String title;
  final String type;
  final String url;

  GifsItem({
    required this.id,
    required this.images,
    required this.title,
    required this.type,
    required this.url,
  });

  factory GifsItem.fromJson(Map<String, dynamic> json) {
    return GifsItem(
      id: json['id'],
      images: Images.fromJson(json['images']),
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }

  static List<GifsItem> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((item) => GifsItem.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images.toJson(),
      'title': title,
      'type': type,
      'url': url,
    };
  }
}
