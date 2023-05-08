import 'package:coffeetruck1/features/registration/presentation/widgets/name_registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nomerController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46, left: 16, right: 16),
        child: Column(
          children: [
            const SizedBox(height: 14,),
            Container(
              height: 33,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Регистрация",
                style:
                TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 24,),
            Spacer(),
            Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Номер телефона',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )),
            const SizedBox(height: 4,),
            TextField(
              maxLength: 9,
              autofocus: true,
              controller: nomerController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '+998',
                hintStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xffFFCC00))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color:Color(0xffFFCC00))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color:Color(0xffFFCC00))),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NameRegistration() ));

                  SharedPreferences pref =
                  await SharedPreferences.getInstance();
                  pref.setString("phone", nomerController.text);
                  setState(() {
                    
                  });

                },
                child: Container(
                  height: 52,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:Color(0xffFFCC00) ,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Продолжить",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
