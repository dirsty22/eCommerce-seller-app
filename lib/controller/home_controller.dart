import 'package:ecommerce_seller/const/const.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsername();
  }
  
  var navIndex =0.obs;
  var username = '';

  getUsername() async{
     var n = await firestore.collection(vendorCollection).where('id',isEqualTo: currentUser!.uid).get().then((value){
      if(value.docs.isNotEmpty){
        return value.docs.single['vendor_name'];

      }
     });
     username= n;
     print("----${username}");
  }
}