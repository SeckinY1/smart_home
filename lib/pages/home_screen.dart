import 'package:flutter/material.dart';
import 'package:smart_home_system/widgets/smart_device.dart';
import '../model/user.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  List mySmartDevices = [
    ["Smart Light", "assets/images/light-bulb.png", true],
    ["Smart Stove", "assets/images/stove.png", true]
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.055,
              left: size.width * 0.04,
              right: size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey[800],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.density_medium,
                    size: 40,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const Text(
            "Welcome Home",
            style: TextStyle(fontSize: 16),
          ),
          velcomeUser(_authService),
          SizedBox(
            height: size.height * 0.001,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: size.width * 0.04)),
          Expanded(
              child: GridView.builder(
            itemCount: mySmartDevices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SmartDeviceBox(
                    pageName:
                        mySmartDevices[index][0].toString().replaceAll(" ", ""),
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                  ));
            },
          ))
        ],
      ),
    );
  }

  StreamBuilder<User?> velcomeUser(AuthService _authService) {
    return StreamBuilder<User?>(
      stream: _authService.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // snapshot ile kullanıcının oturum açıp amadığını sorguluyoruz.
          if (snapshot.hasData) {
            // Kullanıcının e-posta adresini ve UID'sini alıyoruz.
            String? email = snapshot.data!.email;
            //String uid = snapshot.data!.uid;  //Bu yapıyı kullanmıyoruz.

            // E-posta adresini ekrana yazdırıyoruz.
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$email',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            // Kullanıcı oturum açmamışsa veya hata oluştuysa döndürülecek yapı.
            return const Text('Oturum açılmamış veya hata oluştu.');
          }
        } else {
          // Bağlantı durumu active değilse, yükleniyor durumunu gösterilir.
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
