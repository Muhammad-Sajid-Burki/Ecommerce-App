import 'package:flutter_catalog/models/catalog.dart';

class CartModel {


  // catalog field
  CatalogModel _catalog;

// Collection of IDs   store items of each IDs
  final List<int> _itemsIds = [];

// Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the Cart
  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

// Get total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// Add Item
  void add(Item item) {
    _itemsIds.add(item.id);
  }

// Remove Item
  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
