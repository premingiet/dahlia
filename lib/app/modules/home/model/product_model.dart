class ProductModel{
  String? title;
  String? description;
  int? price;
  String? image;

  ProductModel({String title = "", String desc = "", int price= 0, String url = ""}){
    this.title = title;
    this.description = desc;
    this.price = price;
    this.image = url;
  }
}