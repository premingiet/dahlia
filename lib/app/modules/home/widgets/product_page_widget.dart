import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductPageWidget extends StatefulWidget {
  final List<ProductModel> pModel;
  const ProductPageWidget({super.key, required this.pModel});

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemBuilder: (_, i){

          print("************ image link -> ${widget.pModel[i].image} ************");

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 200,
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: widget.pModel[i].image??'',
                  placeholder: (c, url){
                    return Center(
                      child: CircularProgressIndicator(color: Colors.amber,),
                    );
                  },
                  errorWidget: (b, s, e){
                    return Center(child: Icon(Icons.error, color: Colors.red,),);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text("${widget.pModel[i].title??''}"),
              SizedBox(height: 10,),
              Text("${widget.pModel[i].description??''}"),
              SizedBox(height: 10,),
              Text("${widget.pModel[i].price??''}"),
            ],
          );
        },
        separatorBuilder: (_,i){
          return const SizedBox(height: 10,);
        },
        itemCount: widget.pModel.length,
      ),
    );
  }
}
