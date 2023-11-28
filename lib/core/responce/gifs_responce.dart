import 'gifs_item.dart';

class GifsResponse {
  final List<GifsItem> data;

  GifsResponse({
    required this.data,
  });

  factory GifsResponse.fromJson(Map<String, dynamic> json) {
    return GifsResponse(
      data: (json['data'] as List)
          .map((item) => GifsItem.fromJson(item))
          .toList(),
    );
  }
}

