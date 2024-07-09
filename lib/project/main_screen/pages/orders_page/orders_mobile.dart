import 'package:flutter/material.dart';

class OrdersMobile extends StatelessWidget {
  const OrdersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.red.shade50,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: const BoxDecoration(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 6.5,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text('Order Item',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Calibri",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: Color(0xFF662d91),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 6.5,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Form(
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).size.height / 6.5,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
