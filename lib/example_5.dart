import 'package:flutter/material.dart';

class Example5 extends StatefulWidget {
  const Example5({super.key});

  @override
  State<Example5> createState() => _Example5State();
}

class _Example5State extends State<Example5> {

  bool opened = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(),
      body: Container(
        // constraints: BoxConstraints(
        //   maxHeight: 350,
        // ),
        margin: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color(0xFF1590C8),
              child: const Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 15)
                ],
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Claim 1#',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            opened = !opened;
                          });
                        }, icon: opened ? const Icon(Icons.keyboard_arrow_up_outlined) : const Icon(Icons.keyboard_arrow_down_outlined))
                      ],
                    ),
                    Visibility(
                      visible: opened,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Divider(endIndent: 220),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Type: ',
                                  style: TextStyle(
                                    color: Color(0xFF22242A),
                                    fontSize: 16,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Doctor\n',
                                  style: TextStyle(
                                    color: Color(0xFFA4A6B4),
                                    fontSize: 16,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Date: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '02/01/2022\n',
                                  style: TextStyle(
                                    color: Color(0xFFA4A6B4),
                                    fontSize: 16,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Claims From: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Mohannad Qaedan\n',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Total Quantity: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '1 Unit(s)\n',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Claimed Value: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '10.000 JOD\n',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Due Value: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '0.000 JOD\n',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Coinsurance Value: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '0.000 JOD\n',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Subscriber Debit: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '0.000 JOD\n',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: 'Expected Subscriber Debit: ',
                                  style: TextStyle(
                                      color: Color(0xFF22242A),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                TextSpan(
                                  text: '0.000 JOD',
                                  style: TextStyle(
                                      color: Color(0xFFA4A6B4),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
