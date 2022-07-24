import '../models/thing.dart';

class InventoryAPI {
  Future<List<Thing>> getAll() async {
    return [
      Thing(name: 'Hammer', stock: 5),
      Thing(name: 'Drill, Corded', stock: 2),
      Thing(name: 'Drill, Cordless', stock: 3),
      Thing(name: '5 ft Ladder', stock: 1),
      Thing(name: 'Garden Shears', stock: 4),
      Thing(name: 'Prokadima Set', stock: 1),
      Thing(name: 'Bocce Set', stock: 0),
    ];
  }
}
