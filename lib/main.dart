// import 'package:flutter/material.dart';
// import 'dart:ffi'; // 导入 FFI 包
// import 'src/ffi_bindings.dart' as bindings; // 导入生成的绑定文件
//
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('FFI Example')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               // 加载动态库
//               final DynamicLibrary nativeLib = DynamicLibrary.open('hello.dll'); // windows 使用 'hello.dll' 对于 macos，使用 'libhello.dylib'
//
//               // 获取生成的绑定文件中的函数
//               final sumFunction = bindings.FFIBinding(nativeLib).sum;
//
//               // 调用函数
//               final result = sumFunction(10, 20);
//               print('Sum of 10 and 20 is $result');
//             },
//             child: Text('Call sum function'),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:first_flutter_ffi_study_project/src/dynamic_library_utils.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    final sumFunction = DynamicLibraryUtils.getFfiBindings().sum;

    // 调用函数
    final result = sumFunction(10, 20);
    print('Sum of 10 and 20 is $result');

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
