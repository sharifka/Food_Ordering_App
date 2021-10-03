class CategoryModel {
  late String id,name,description,thumbnail;
   
   CategoryModel.fromJson(Map<String,dynamic> json) {
     id=json['cat_id'];
     name=json['name'];
     description=json['description'];
     thumbnail=json['thumbnail'];
   }

}