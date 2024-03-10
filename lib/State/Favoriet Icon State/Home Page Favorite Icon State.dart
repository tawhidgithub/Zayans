import 'package:get/get.dart';

class FavoriteIconState extends GetxController{
  RxBool isFavorite=false.obs;




  ChangeisFavorite(  bool Fevorite ){
 isFavorite.value=Fevorite;

  }



}