import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/newtransaction.dart';
import 'models/Transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //this  make the app in portrait  mode only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor primaryColor = Colors.green;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'OpenSans',
            primarySwatch: primaryColor,
            scaffoldBackgroundColor: primaryColor.shade50),
        home: //HomePage(),
            AnimatedSplashScreen(
          centered: true,
          backgroundColor: primaryColor.shade100,
          splash: Center(
            child: Container(
                child: const Image(
                    image: AssetImage("assets/images/weekly logo.png"),
                    fit: BoxFit.cover)),
          ),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.scaleTransition,
          duration: 2000,
          nextScreen: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showchart = false;

  final List<Transaction> userTransactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 300, date: DateTime(2024, 2, 23)),
    Transaction(
        id: "t2", title: "Scooter", amount: 500, date: DateTime(2024, 2, 23)),
    Transaction(
        id: "t3", title: "Hangout", amount: 450, date: DateTime(2024, 2, 23)),
    Transaction(
        id: "t4", title: "Groceries", amount: 250, date: DateTime(2024, 2, 24)),
    Transaction(
        id: "t5",
        title: "Gym Membership",
        amount: 600,
        date: DateTime(2024, 2, 25)),
    Transaction(
        id: "t6",
        title: "Coffee & Snacks",
        amount: 85,
        date: DateTime(2024, 2, 25)),
    Transaction(
        id: "t7",
        title: "Streaming Subscription",
        amount: 120,
        date: DateTime(2024, 2, 26)),
    Transaction(
        id: "t8",
        title: "Electricity Bill",
        amount: 350,
        date: DateTime(2024, 2, 27)),
    Transaction(
        id: "t9",
        title: "Books & Learning",
        amount: 180,
        date: DateTime(2024, 2, 27)),
    Transaction(
        id: "t10",
        title: "Office Chair",
        amount: 1200,
        date: DateTime(2024, 2, 28)),
  ];

  String createID() {
    if (userTransactions.isEmpty) {
      return "t1";
    }
    String temp = userTransactions[0].id.substring(1);
    int num = 1 + int.parse(temp);
    String newID = "t$num";
    return newID;
  }

  void addtransaction(String title, String amount, DateTime date) {
    final newtransaction = Transaction(
        id: createID(), title: title, amount: double.parse(amount), date: date);
    setState(() {
      userTransactions.insert(0, newtransaction);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((element) => element.id == id);
    });
  }

  void startaddnewtransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addtransaction);
        });
  }

  List<Transaction> get recenttransaction {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final islandscape = mediaQuery.orientation == Orientation.landscape;
    final appbar = AppBar(
      centerTitle: true,
      title: const Text(
        "Weekly",
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      //backgroundColor: Colors.brown.shade800,
      actions: <Widget>[
        IconButton(
            onPressed: () => startaddnewtransaction(context),
            icon: const Icon(Icons.add))
      ],
    );
    final transactionListWidget = Container(
        height: (MediaQuery.sizeOf(context).height -
                appbar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(userTransactions, deleteTransaction));
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //backgroundColor: Colors.brown.shade50,
      appBar: appbar,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (islandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Show chart"),
                Switch.adaptive(
                    value: showchart,
                    onChanged: (value) {
                      setState(() {
                        showchart = value;
                      });
                    }),
              ],
            ),
          if (!islandscape)
            Container(
                height: (MediaQuery.sizeOf(context).height -
                        appbar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(recenttransaction)),
          if (!islandscape) transactionListWidget,

          if (islandscape)
            showchart
                ? Container(
                    height: (MediaQuery.sizeOf(context).height -
                            appbar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.8,
                    child: Chart(recenttransaction))
                : Container(
                    height: (MediaQuery.sizeOf(context).height -
                            appbar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.9,
                    child: TransactionList(userTransactions, deleteTransaction))
          //NewTransaction(addtransaction),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.brown.shade800,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => startaddnewtransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
