import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Obx(
          () => controller.onloading.value == false
              ? ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    HeadingWidget(
                      controller: controller,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          LihatSemuaWidget(
                            onPressed: () {}, label: 'Statik Nilai',
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const OnLoading(),
        ),
      ),
    );
  }
}

class LihatSemuaWidget extends StatelessWidget {
  final Function() onPressed;
  final String label;
  const LihatSemuaWidget({
    Key? key,
    required this.onPressed, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Lihat Semua',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.selamatDatang,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xff808080,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  controller.infoSiswa.nama,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () => Get.dialog(
                  Image.network(
                    controller.infoSiswa.imageSiswa,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.infoSiswa.imageSiswa,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnLoading extends StatelessWidget {
  const OnLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
