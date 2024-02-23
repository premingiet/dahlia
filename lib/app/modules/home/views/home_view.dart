import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testw/app/modules/home/widgets/product_page_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Display"),
      ),
      body: Obx(() {
        controller.pmList.length;
        controller.currentLimit.value;
        controller.currentSkip.value;
        //controller.filteredList.length;
        return Column(
          children: [
            Expanded(
              child: ProductPageWidget(
                pModel: controller.pmList,
              ),
            ),
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i){
                      return CircleAvatar(
                        child: Center(
                          child: Text("$i"),
                        ),
                      );
                    },
                    separatorBuilder: (_, i){
                      return SizedBox(width: 20,);
                    },
                    itemCount: controller.pmList.length,
                ),
              ),
              // pagination display
            ),
            ElevatedButton(onPressed: (){
              controller.currentSkip.value += 10;
              controller.fetchProducts(controller.currentLimit.value, controller.currentSkip.value);
            },
                child: Text("fetch products and add Skip + 10")),
          ],
        );
      }),
    );
  }
}

