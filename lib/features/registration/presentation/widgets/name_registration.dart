import 'package:coffeetruck1/features/home/presentation/pages/homepage.dart';
import 'package:coffeetruck1/features/home/presentation/widgets/homewidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NameRegistration extends StatefulWidget {
  const NameRegistration({Key? key}) : super(key: key);

  @override
  State<NameRegistration> createState() => _NameRegistrationState();
}

class _NameRegistrationState extends State<NameRegistration> {
  TextEditingController nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/close.svg"),
          )
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text(
                  "Регистрация",
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Имя фамилия",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 4,),
                TextFormField(
                  controller: nameController,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Введите ваше имя";
                    }
                  }),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff2B2A28),
                  ),
                  cursorColor: Color(0xffFFCC00),
                  decoration: InputDecoration(
                    hintText: "Введите имя",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide:
                        BorderSide(color: Color(0xFF707070), width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Color(0xFFFFCC00), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Color(0xFFFFCC00), width: 1),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () async {
                    SharedPreferences nomer =
                    await SharedPreferences.getInstance();
                    
                    setState(() {
                      nomer.setBool("activ", false);
                      
                    });
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeWidget()), (route) => false);

                  },
                  child: Container(
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffFFCC00),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "Продолжить",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
