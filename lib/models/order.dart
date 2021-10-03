class OrderModel{
  late String status,message;

  OrderModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    message=json['message'];
  }
}