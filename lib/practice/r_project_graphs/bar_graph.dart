import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practice_flutter/common_utils/constants.dart';
import 'package:practice_flutter/temp/page1.dart';
import 'package:practice_flutter/temp/page2.dart';

class GraphDropdown extends StatefulWidget {
  const GraphDropdown({super.key});
  @override
  State<GraphDropdown> createState() => _GraphDropdownState();
}

class _GraphDropdownState extends State<GraphDropdown> {
  List<Map<String, String>> graphData = [
    {'graph': 'Line chart', 'endpoint': 'line-graph'},
    {'graph': 'Bar chart', 'endpoint': 'bar-graph-path'},
    {'graph': 'Pie chart', 'endpoint': 'pie-graph-link'},
    {'graph': 'Area chart', 'endpoint': 'area-graph'},
    {'graph': 'Scatter chart', 'endpoint': 'scatter-graph'},
    {'graph': 'Heat chart', 'endpoint': 'heatgraph-graph'},
    {'graph': 'Histogram chart', 'endpoint': 'histogram-graph'},
    {'graph': 'Json Bar chart', 'endpoint': 'json-bargraph'},
    {'graph': 'Json Line chart', 'endpoint': 'json-linegraph'},
    {
      'graph': 'Ex-Json Line chart',
      'endpoint': 'generate-graph-externaljsondata'
    },
  ];

  String? selectedGraph;
  String? selectedEndpoint;
  late Future<String> future;

  @override
  void initState() {
    super.initState();
    future = getGraph();
  }

  Future<String> getGraph({
    String endpoint = 'line-graph',
  }) async {
    try {
      http.Response jsonResponse =
          await http.get(Uri.parse('$baseUrl$endpoint'));
      if (jsonResponse.statusCode == 200) {
        Map<String, dynamic> response = jsonDecode(jsonResponse.body);
        print('response: ${response['generatedImagePath']}');
        return response['result'];
      } else {
        throw Exception(
            'Failed to generate graph image: ${jsonResponse.statusCode}');
      }
    } catch (e) {
      print('catch: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          print('onPopInvoked if called');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Page2()));
        } else {
          print('onPopInvoked else called');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Page1()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('R Graphs'),
          actions: [
            DropdownButton<String>(
              hint: const Text('Select a graph'),
              value: selectedGraph,
              items: graphData.map((Map<String, String> graphItem) {
                return DropdownMenuItem<String>(
                  value: graphItem['graph'],
                  child: Text(graphItem['graph']!),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGraph = newValue;
                  selectedEndpoint = graphData.firstWhere(
                      (element) => element['graph'] == newValue)['endpoint'];
                  print('Selected endpoint: $selectedEndpoint');

                  future = getGraph(endpoint: selectedEndpoint as String);
                });
              },
            ),
            const SizedBox(
              width: 40,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<String>(
                    future: future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        print('snapshot.data: ${snapshot.data}');
                        return SizedBox(
                          child: Image.network(
                            width: 600,
                            snapshot.data ??
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_P--jTt0SNpr6TvtJmyyenDiwuHBJJCabBJwwIa81JPj379lRrR3_nD989Q&s',
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
