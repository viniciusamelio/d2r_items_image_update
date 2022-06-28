class ItemModel {
  ItemModel({
    required this.id,
    required this.name,
    required this.src,
    required this.type,
  });
  final String id;
  final String name;
  final String src;
  final String type;

  static ItemModel fromJson(Map json) => ItemModel(
        id: json["_id"].toString(),
        name: json["name"].toString(),
        src: json["src"].toString(),
        type: json["type"].toString(),
      );
}
