import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_new/constants.dart';
import 'package:shop_new/controller/controller.dart';
import 'package:shop_new/controller/unordered_list.dart';
import 'package:shop_new/screens/checkout_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetails extends StatefulWidget {
   const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final Images  _images = Images();
   List<String> pdtImages =[];
    bool favourite=false;
   int activeIndex=0;

  @override
  Widget build(BuildContext context) {
   //adding product images to the pdtImages List
    pdtImages.isEmpty?
    pdtImages.addAll(_images.pdtImages):null;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text("ShopNow"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
child:
SizedBox(
  height: size(context).height,
  child:   Column(
    children: [
      //showing product details
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  SizedBox(
                    width: size(context).width,
                    height: size(context).height/carouselHeight,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              clipBehavior: Clip.none,
                              height: 270.0,
                              pageSnapping: false,
                              enlargeCenterPage: true,
                              onPageChanged: (index,reason){
                                setState(() {
                                  activeIndex=index;
                                });

                              }

                          ),

                          itemCount: pdtImages.length,

                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                              Container(
                                margin:const EdgeInsets.all(10),
                                height: size(context).height/carouselHeight,
                                width:  size(context).width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(pdtImages[itemIndex]),
                                        fit:BoxFit.fill ),
                                    borderRadius:const BorderRadius.all(Radius.circular(10))
                                ),


                              ),
                        ),
                        Positioned(
                          right: size(context).width/8,
                            top: size(context).width/largeTextHeight,
                            child:ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),

                                    primary: Colors.white,
                                    ),
                                onPressed: (){
                                  setState(() {
                                    if(favourite==true){
                                      favourite=false;
                                    }
                                    else{
                                      favourite=true;
                                    }
                                  });
                                },
                                child: Icon(Icons.favorite,
                                  color:favourite? Colors.red:Colors.grey[200],
                                    size:size(context).height/30
                                ))
                        )
                      ],
                    ),
                  ),
         SizedBox(height: size(context).height/dividerHeight,),
            // shows which image is showing
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count:  4,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10

                    ),
                  ),
              ),
            ),
            SizedBox(height: size(context).height/dividerHeight,),
            text(
                text:controller.pdtDetails,
            size: size(context).height/mediumTextHeight),
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: size(context).width/ratingRawWidth,
                    height: size(context).height/ratingRowHeight  ,
                    child: ListView.builder(
                      itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                      return Icon(Icons.star,size: size(context).height/largeTextHeight,color: Colors.green,);
                    }),
                  ),
                  text(
                      text: "100 ratings",
                    color: Colors.grey,
                    size: size(context).height/smallTextHeight,
                    weight: FontWeight.bold,

                  )
                 ],
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.lightGreenAccent[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size(context).width,
                  height: size(context).height/cardHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      text(
                          text: "\u{20B9} 14000 off",
                      size: size(context).height/smallTextHeight,
                      color: Colors.green,
                      weight: FontWeight.bold),
                      SizedBox(
                        width: size(context).width/priceRowWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(text: "43990",
                              decoration: true,
                              color: Colors.grey,
                              weight:FontWeight.bold,
                              size: size(context).height/largeTextHeight,

                            ),
                            text(text: "29990",
                              color: Colors.black,
                              weight:FontWeight.bold,
                              size: size(context).height/largeTextHeight,

                            ),
                            text(text: "31% off",
                              color: Colors.green,
                              weight:FontWeight.bold,
                              size: size(context).height/largeTextHeight,

                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size(context).height/dividerHeight,),
            text(text: "Highlights",
              color: Colors.black,
              weight:FontWeight.w600,
              size: size(context).height/mediumTextHeight,

            ),
            SizedBox(height: size(context).height/dividerHeight,),
            UnorderedList(
             texts:   controller.highlights,
            )
          ],
        ),
      ),
      Expanded(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Get.snackbar("Item added to cart", "",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.grey,)
              ;
            },
            child: SizedBox(
              width: size(context).width/2,
              //height: size(context).height/10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart,
                  color: Colors.black,),
                  text(text: "ADD TO CART",
                  size: size(context).height/extraSmallTextHeight,
                  weight: FontWeight.bold)
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                Get.to(CheckoutScreen());
              },
              child: Container(
                //width: size(context).width/2,
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(Icons.shopping_bag,
                      size: size(context).height/smallTextHeight,
                      color: Colors.white,),
                      text(text: "BUY NOW",
                          size: size(context).height/extraSmallTextHeight,
                          weight: FontWeight.bold,
                      color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
      )
    ],
  ),
)
        ),
      ),
    );

  }
  text({
    required String text,
    double size=15,
    FontWeight weight = FontWeight.normal,
    Color color = Colors.black,
    bool decoration=false,
  }){
    return Text(text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        decorationStyle:decoration? TextDecorationStyle.solid:null,
        decoration: decoration? TextDecoration.lineThrough:null,
        decorationColor:decoration? color:null,
        decorationThickness: decoration? 2:null

      ),
    );
  }
}
