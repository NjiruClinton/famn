import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TransactionModel {
  final String logo;
  final String name;
  final String date;
  final String amount;

  const TransactionModel({
    required this.logo,
    required this.name,
    required this.date,
    required this.amount,
  });
}

//sfCircularChart data
List<TransactionModel> _chartData = [
  TransactionModel(
    logo: 'assets/images/food.png',
    name: 'Food',
    date: '129/09/2022',
    amount: '350',
  ),
  TransactionModel(
    logo: 'assets/images/gas-station.png',
    name: 'Pertol',
    date: '22/09/2022',
    amount: '900',
  ),
  TransactionModel(
    logo: 'assets/images/kfc.png',
    name: 'KFC',
    date: '20/09/2022',
    amount: '700',
  ),
  TransactionModel(
    logo: 'assets/images/shopping.png',
    name: 'Shopping',
    date: '17/09/2022',
    amount: '900',
  ),
  TransactionModel(
    logo: 'assets/images/uber.png',
    name: 'Uber',
    date: '17/09/2022',
    amount: '300',
  ),
  TransactionModel(
    logo: 'assets/images/mpesa.png',
    name: 'Mpesa',
    date: '15/09/2022',
    amount: '500',
  ),
];


class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monthly Transactions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 500,
                        height: 400,
                        child: MonthlyGraph()
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _chartData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      _chartData[index].logo,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _chartData[index].name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _chartData[index].date,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('Ksh ${_chartData[index].amount}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// monthly graph
class MonthlyGraph extends StatelessWidget {
  const MonthlyGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SfCircularChart(
                        series: <CircularSeries>[
                          DoughnutSeries<TransactionModel, String>(
                            dataSource: _chartData,
                            xValueMapper: (TransactionModel data, _) => data.name,
                            yValueMapper: (TransactionModel data, _) => double.parse(data.amount),
                            pointColorMapper: (TransactionModel data, _) => data.color,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              labelPosition: ChartDataLabelPosition.outside,
                              useSeriesColor: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// data.color and data.amount

extension TransactionModelExtension on TransactionModel {
  Color get color {
    switch (name) {
      case 'Food':
        return Colors.red;
      case 'Pertol':
        return Colors.blue;
      case 'KFC':
        return Colors.green;
      case 'Shopping':
        return Colors.yellow;
      case 'Uber':
        return Colors.purple;
      case 'Mpesa':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
  // amount
  int get amount {
    switch (name) {
      case 'Food':
        return 350;
      case 'Pertol':
        return 1000;
      case 'KFC':
        return 700;
      case 'Shopping':
        return 1500;
      case 'Uber':
        return 170;
      case 'Mpesa':
        return 500;
      default:
        return 0;
    }
  }

}
