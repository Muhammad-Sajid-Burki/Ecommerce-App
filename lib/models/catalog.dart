import 'dart:convert';

class CatalogModel {

  static List<Item> items;

  // Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by Position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final num price;
  final String desc;
  final String color;
  final String image;

  Item({
    this.id,
    this.name,
    this.price,
    this.desc,
    this.color,
    this.image,
  });

  Item copyWith({
    int id,
    String name,
    num price,
    String desc,
    String color,
    String image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'desc': desc,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      desc: map['desc'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price, desc: $desc, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.desc == desc &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
