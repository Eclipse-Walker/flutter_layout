import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PairPricePage extends StatefulWidget {
  const PairPricePage({super.key});

  @override
  PairPricePageState createState() => PairPricePageState();
}

class PairPricePageState extends State<PairPricePage> {
  final List<TextEditingController> _priceControllers = [
    TextEditingController(),
    TextEditingController()
  ];
  final List<TextEditingController> _volumeControllers = [
    TextEditingController(),
    TextEditingController()
  ];

  void _addPriceField() {
    setState(() {
      _priceControllers.add(TextEditingController());
      _volumeControllers.add(TextEditingController());
    });
  }

  void _removePriceField(int index) {
    setState(() {
      if (_priceControllers.length > 2) {
        _priceControllers.removeAt(index);
        _volumeControllers.removeAt(index);
      }
    });
  }

  void _checkPrices() {
    double? cheapestUnitPrice;
    int? cheapestIndex;
    double? highestUnitPrice;

    List<PriceData> priceDataList = [];
    List<BarChartGroupData> barChartData = [];

    for (int i = 0; i < _priceControllers.length; i++) {
      double price = double.tryParse(_priceControllers[i].text) ?? 0;
      double volume = double.tryParse(_volumeControllers[i].text) ?? 0;

      if (volume > 0) {
        double unitPrice = price / volume;
        priceDataList.add(PriceData('Product ${i + 1}', unitPrice));

        if (cheapestUnitPrice == null || unitPrice < cheapestUnitPrice) {
          cheapestUnitPrice = unitPrice;
          cheapestIndex = i;
        }

        if (highestUnitPrice == null || unitPrice > highestUnitPrice) {
          highestUnitPrice = unitPrice;
        }
      }
    }

    double? priceRange = highestUnitPrice != null && cheapestUnitPrice != null
        ? highestUnitPrice - cheapestUnitPrice
        : null;

    for (int i = 0; i < priceDataList.length; i++) {
      Color barColor;
      if (priceRange != null) {
        double normalizedPrice =
            (priceDataList[i].unitPrice - cheapestUnitPrice!) / priceRange;
        if (normalizedPrice < 0.25) {
          barColor = Colors.green;
        } else if (normalizedPrice < 0.5) {
          barColor = Colors.lightGreen;
        } else if (normalizedPrice < 0.75) {
          barColor = Colors.yellow;
        } else if (normalizedPrice < 0.9) {
          barColor = Colors.orange;
        } else {
          barColor = Colors.red;
        }
      } else {
        barColor = Colors.blue;
      }

      barChartData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: priceDataList[i].unitPrice,
              color: barColor,
              width: 20,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 0,
                color: Colors.grey[200],
              ),
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      );
    }

    if (cheapestIndex != null) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Product ${cheapestIndex! + 1} is the cheapest!',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 300,
                    child: BarChart(
                      BarChartData(
                        barGroups: barChartData,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text('Product ${value.toInt() + 1}');
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 56,
                              interval: 0.5,
                              getTitlesWidget: (value, meta) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    value.toStringAsFixed(1),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color ??
                                            Colors.black,
                                        fontSize: 10),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipPadding: const EdgeInsets.all(5),
                            tooltipMargin: 8,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                rod.toY.toStringAsFixed(2),
                                TextStyle(
                                  color: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.color ??
                                      Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter valid prices and volumes.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pair Price \$'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 0,
              top: 5,
            ),
            child: Text(
              'Which one is cheaper? You can easily check!',
              style: TextStyle(),
            ),
          ),
          ..._priceControllers.asMap().entries.map((entry) {
            int index = entry.key;
            TextEditingController priceController = entry.value;
            TextEditingController volumeController = _volumeControllers[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                _removePriceField(index);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: priceController,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: volumeController,
                        decoration: const InputDecoration(
                          labelText: 'Volume',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: _addPriceField,
              child: const Text('Add Price Field'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: _checkPrices,
              child: const Text('Check!'),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceData {
  final String product;
  final double unitPrice;

  PriceData(this.product, this.unitPrice);
}
