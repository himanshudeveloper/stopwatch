import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: size.height * 0.25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: 50,
                  child: TabBar(
                    labelColor: Colors.blueAccent,
                    indicatorColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.grey,
                    controller: tabController,
                    tabs: [
                      Row(
                        children: const [
                          Icon(Icons.timer),
                          Text('TIMER'),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.timer),
                          Text('STOPWATCH'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                SizedBox(
                  height: size.height * 0.18,
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      Timerwidget(),
                      Stopwatchwidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Timerwidget extends StatelessWidget {
  const Timerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '5',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Text('m'),
            const SizedBox(width: 10),
            Text(
              '00',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Text('s'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
          height: 1,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Start"),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              onPressed: () {},
              child: const Text("Reset"),
            )
          ],
        )
      ],
    );
  }
}

class Stopwatchwidget extends StatelessWidget {
  const Stopwatchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Text('s'),
            const SizedBox(width: 10),
            Text(
              '00',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
          height: 1,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Start"),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              onPressed: () {},
              child: Text("Reset"),
            )
          ],
        )
      ],
    );
  }
}
