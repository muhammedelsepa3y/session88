import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:session88/models/custom_response.dart';
import 'package:session88/models/person.dart';
import 'package:session88/services/api_service.dart';
import 'package:session88/services/desk_storage.dart';
import 'package:session88/services/home_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(PersonAdapter());
  // var box=await Hive.openBox("counter");
  // var personsBox=await Hive.openBox<Person>("personsBox");
  // Person person=Person(name: "Sayed", age: 15, address: "Giza");
  // personsBox.add(person);
  // personsBox.values.forEach((element) {
  //   print(element.name+" "+element.age.toString());
  // });
  // person.age=30;
  // person.save();
  // personsBox.values.forEach((element) {
  //   print(element.name+" "+element.age.toString());
  // });
  // person.delete();
  // personsBox.values.forEach((element) {
  //   print(element.name+" "+element.age.toString());
  // });
  // await box.put("counterValue", 0);
  // int counterVal=await box.get("counterValue");
  // Logger().e(counterVal);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<DeskStorage>(create:(context)=>DeskStorage() ),
        ChangeNotifierProvider<HomeProvider>(create:(context)=>HomeProvider() )
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DeskStorage>(context,listen: false).getAllData();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Counter App"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await Provider.of<HomeProvider>(context,listen: false).getPersonDetails();

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
