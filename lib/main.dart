import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_zimkit/services/services.dart';

import 'inappchat.dart';

void main() {
  ZIMKit().init(
    appID: , // your appid
    appSign:, // your appSign
  );
  ZIMKit().connectUser(id: '4', name: "2");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final formkey=GlobalKey<FormState>();
  final namecontroller=TextEditingController(text:'USER-NAME');
  final idcontroller=TextEditingController(text:'ID');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('zegocloud video call app'),

      ),
        body:Form(
          key:formkey,
          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(controller: namecontroller),
                SizedBox(height:20),
                TextFormField(controller: idcontroller),
               ElevatedButton(

                  onPressed: () { Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => const ZIMKitDemoHomePage(),
    ));

               }, child: Text("In App Chat"))

              ],
            ),
          )


        ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CallPage(callID: "1", username: namecontroller.text.toString(), id: idcontroller.text.toString(),)));

      },
      child: Text('call'),),
    );
  }
}

class CallPage extends StatelessWidget{


  const CallPage({Key? key, required this.callID,required this.username,required this.id}) : super(key: key);
  final String callID;
  final String username;
  final String id;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1285910577, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: '5cec53aa2a235d9ad1c0dd1eced80b1d9da85a86f732962a18e3d241362d6990', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: id,
      userName:username,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (_) => Navigator.of(context).pop(),
    );
  }
}