class FoodsModel {
  late String id, name, description, image, category;
  late double price;
  late DateTime createdDate;
  late int quantity;
  late double total;

  FoodsModel.fromJson(Map<String, dynamic> json) {
    id = json['f_id'];
    name = json['name'];
    price = double.parse(json['price']);
    description = json['description'];
    image = json['image'];
    category = json['category'];
    createdDate = DateTime.parse(json['created_date']);
    quantity = 1;
    total = 0;
  }
  void increments() {
    quantity++;
  }

  void decrement() {
    quantity == 1 ? quantity = 1 : quantity--;
  }
   
}
