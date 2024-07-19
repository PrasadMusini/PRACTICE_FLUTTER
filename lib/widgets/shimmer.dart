import 'package:flutter/material.dart';
import 'package:practice_flutter/common_utils/widgets.dart';
import 'package:practice_flutter/pages/test.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar('Shimmer Screen', () {
        CommonWidgets.navigateTo(context, const Test());
      }),
      body: _shimmer(),
    );
  }

  Widget _shimmer() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.grey.withOpacity(0.2),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 22,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 100,
                                height: 30,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: 40,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
