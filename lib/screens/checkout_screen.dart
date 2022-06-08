import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_new/constants.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({Key? key}) : super(key: key);
 final TextEditingController nameController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();
   final TextEditingController mailController = TextEditingController();
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text("ShopNow"),
        backgroundColor: Colors.green,
      ),
      body: SizedBox(
        height: size(context).height,
        width:size(context).width,
        child: Padding(
          padding:  EdgeInsets.all(size(context).height/20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size(context).height/10,),
                Form(
                  key: _formKey,
                  child:Column(
                    children: [
                      textField(
                        hintText: "Enter your Name",
                        controller:nameController,
                        icon: Icon(Icons.person,color: Colors.grey[700],
                        ),
                        validator: (value){
                          if(!GetUtils.isAlphabetOnly(value!)) {
                            return "Please enter valid name";
                          }
                          else if(GetUtils.isNull(value)){
                            return "Please fill this field";
                          }
                        }
                      ),
                      SizedBox(height: size(context).height/20,),
                      textField(
                          hintText: "Enter Phone number",
                          type: TextInputType.number,
                          controller:phoneController,
                          icon: Icon(Icons.call,color: Colors.grey[700],
                          ),
                          validator: (value){
                            if(!GetUtils.isPhoneNumber(value!)) {
                              return "Please enter valid phone Number";
                            }
                            else if(GetUtils.isNull(value)){
                              return "Please fill this field";
                            }
                          }
                      ),
                      SizedBox(height: size(context).height/20,),
                      textField(
                          hintText: "Enter email",
                          controller:mailController,
                          icon: Icon(Icons.message,color: Colors.grey[700],
                          ),
                          validator: (value){
                            if(!GetUtils.isEmail(value!)) {
                              return "Please enter valid Email";
                            }
                            else if(GetUtils.isNull(value)){
                              return "Please fill this field";
                            }
                          }
                      ),
                      SizedBox(height: size(context).height/20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          primary: Colors.green,
                        ),
                          onPressed: (){
                            if (_formKey.currentState!.validate()){
                              Get.snackbar("Form submitted", "",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey,)
                              ;
                            }
                            else{
                              Get.snackbar("Please fill valid details", "",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,);
                            }
                          },
                          child: const Text("Proceed"),
                      )


                    ],
                  ) ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textField({
    required Icon icon,
    TextInputType type = TextInputType.text,
    required String hintText,
    required TextEditingController controller,
    String? Function(String?)? validator

  }){
    return TextFormField(
      keyboardType:type ,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor:const Color(0xFFFFFFFF),
        prefixIcon: icon,
        border:const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
      ),
      controller: controller,
    );
  }
}
