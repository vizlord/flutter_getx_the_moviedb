import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/index.dart';
import '../../../models/index.dart';
import '../../../ui/widgets/index.dart';

class UpcomingMoviesTab extends GetView<UpcomingMoviesController> {
  const UpcomingMoviesTab({Key? key}) : super(key: key);

  Future<void> refreshPage() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refreshPage(),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                controller.obx(
                  (MovieWrapper? movieWrapper) {
                    if (movieWrapper != null) {
                      return ProductList(
                        productList: movieWrapper.results,
                        isMovie: true,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
