import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisocash/screens/auth/login_screen.dart';
import 'package:lisocash/screens/auth/register/user_infos_screen.dart';
import 'package:lisocash/utils/my_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Stack(
        children: [
          
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            
            decoration: BoxDecoration(
              
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.primary.withOpacity(0.9),
                  MyColors.primary,
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  SizedBox(
                    height: 110,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 30,),

                  Text(
                    "Envoyez de l'argent en un clic",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: MyColors.white.withOpacity(0.95)
                    ),
                  ),

                 const Spacer(),

                  SizedBox(
                    height: 45.0,
                    width: double.infinity,
                    
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, CupertinoPageRoute(
                            builder: (context) => const LoginScreen()
                          )
                        );
                      },
                      style: TextButton.styleFrom(
                        // primary: Colors.white,
                        backgroundColor: MyColors.white.withOpacity(0.9),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ), 
                        side: const BorderSide(color: MyColors.white, width: 1.4)
                      ),
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          color: MyColors.primary,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  SizedBox(
                    height: 45.0,
                    width: double.infinity,
                    
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, CupertinoPageRoute(
                            builder: (context) => const UserInfoscreen()
                          )
                        );
                      },
                      style: TextButton.styleFrom(
                        // primary: Colors.white,
                        backgroundColor: MyColors.primary.withOpacity(0.9),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: MyColors.white, width: 1.4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          )
                        ), 
                      ),
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}