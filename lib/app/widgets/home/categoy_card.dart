import 'package:book_store/app/models/category_model.dart';
import 'package:book_store/app/modules/books/views/books_view.dart';
import 'package:book_store/app/utils/colors.dart';
import 'package:book_store/app/utils/constants.dart';
import 'package:book_store/app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/screen_utils.dart';


class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 3,
      margin:  EdgeInsets.only(bottom: 20, left: hPadding,right: hPadding),
      child: InkWell(
        onTap: () => Get.to(() =>  BooksView(topic: category.categoryName!)),
        child: Container(
          color: Colors.transparent,
          width: responsiveSize(context,ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(100, context), ScreenUtils.responsiveW(30, context)),
          padding:  EdgeInsets.symmetric(horizontal: 10,vertical: responsiveSize(context,10, 10, 15)),
         // margin: const EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(category.asset!,height: 26,width: 24,),
                  const SizedBox(width: 20,),
                  Text(category.categoryName!,style: montseratRegular.copyWith(fontSize: 18,fontWeight: FontWeight.bold),),
                ],
              ),
              Icon(Icons.arrow_forward_sharp,color: primaryPurpleColor,size: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
