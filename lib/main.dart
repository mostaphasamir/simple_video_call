import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController callId = TextEditingController();
  TextEditingController uName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Video Call"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              controller: callId,
              decoration: const InputDecoration(
                label: Text("Call ID"),
              ),
            ),TextFormField(
              controller: uName,
              decoration: const InputDecoration(
                label: Text("User Name"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>CallPage(callID: callId.text, uName: uName.text)));
        },
        child: const Text("Call"),
      ),
    );
  }
}




class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID,required this.uName}) : super(key: key);
  final String callID;
  final String uName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 807702053, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "215e60323bd42ae94487f0000f5505de05049c24045cd4061e37508ee97a479a", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: "${uName}m1",
      userName: uName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}

