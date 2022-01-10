import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final onloading = false.obs;
  final users = FirebaseFirestore.instance;
  late String nis = '';
  var jam = 19;
  var selamatDatang = "";
  late InfoSiswa infoSiswa =
      InfoSiswa("nis", "namaOrangTua", "noOrtu", "imageSiswa");

  Future getDataSiswa() async {
    onloading.value = !onloading.value;
    await users
        .collection("Siswa")
        .doc(nis)
        .collection('nilai')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print(element.data());
      });
    }).whenComplete(() => onloading.value = !onloading.value);
  }

  Future getInfoSiswa() async {
    onloading.value = !onloading.value;
    await users
        .collection("Siswa")
        .doc(nis)
        .get()
        .then(
          (value) => infoSiswa = InfoSiswa(
            value.data()!['nama'].toString(),
            value.data()!['namaOrtu'].toString(),
            value.data()!['noOrtu'].toString(),
            value.data()!['imageSiswa'].toString(),
          ),
        )
        .whenComplete(
          () => onloading.value = !onloading.value,
        );
    print(infoSiswa.imageSiswa);
  }

  @override
  void onInit() async {
    nis = Get.arguments;
    if (jam < 12 && jam > 5) {
      selamatDatang = "Selamat Pagi";
    } else if (jam >= 12 && jam < 15) {
      selamatDatang = "Selamat Siang";
    } else if (jam >= 15 && jam < 19) {
      selamatDatang = "Selamat Sore";
    } else if (jam >= 19) {
      selamatDatang = "Selamat Malam";
    }
    await getInfoSiswa();
    // print();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class InfoSiswa {
  final String nama;
  final String namaOrangTua;
  final String noOrtu;
  final String imageSiswa;
  InfoSiswa(this.nama, this.namaOrangTua, this.noOrtu, this.imageSiswa);
}
