import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Container(
            padding: const EdgeInsets.all(20), //in
            // height: 200,
            decoration: const BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            width: MediaQuery.of(context).size.width * 0.93,
            child: Stack(
              children: [
                const Positioned( 
                  right: 70,
                  top: -5,
                  child: Icon(
                    Icons.circle, 
                    size: 120,
                    color: Color(0x10000000),
                  )
                ),

                const Positioned( 
                  right: 10,
                  top: 40,
                  child: Icon(
                    Icons.circle, 
                    size: 125,
                    color: Color(0x1AE2E2E2),
                  )
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            color: Colors.grey[50],
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/puce.png',
                              )
                            )
                          ),
                        ),

                        const Text(
                          'CEDAICI',
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            color: Colors.white,
                            fontSize: 17,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            '⬤ ⬤ ⬤ ⬤',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.2,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '⬤ ⬤ ⬤ ⬤',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.2,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '⬤ ⬤ ⬤ ⬤',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '2918',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.2,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),

                    const Padding(
                      padding: EdgeInsets.only(left: 17, bottom: 10),
                      child: Text(
                        'EXP 02/2025',
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          color: Colors.white,
                          fontSize: 13,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'JONATHAN DOE',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          Text(
                            'VISA',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}