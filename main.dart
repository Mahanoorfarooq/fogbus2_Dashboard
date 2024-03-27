import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(
    BuildContext context) {
    return MaterialApp(
      title: 'FogBus2 Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FogBus2 Dashboard'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Container Status'),
            ContainerStatusList(),
            SizedBox(height: 20.0),
            SectionTitle(title: 'Resource Usage'),
            ResourceUsage(),
            SizedBox(height: 20.0),
            SectionTitle(title: 'Network Metrics'),
            NetworkMetrics(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}

class ContainerStatusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerStatusItem(name: 'Container 1', isRunning: true),
        ContainerStatusItem(name: 'Container 2', isRunning: false),
        ContainerStatusItem(name: 'Container 3', isRunning: true),
      ],
    );
  }
}

class ContainerStatusItem extends StatelessWidget {
  final String name;
  final bool isRunning;

  const ContainerStatusItem({required this.name, required this.isRunning});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: Icon(
        isRunning ? Icons.check_circle : Icons.cancel,
        color: isRunning ? Colors.green : Colors.red,
      ),
    );
  }
}

class ResourceUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceUsageItem(name: 'User1', usage: 0.6),
        ResourceUsageItem(name: 'User2', usage: 0.8),
        ResourceUsageItem(name: 'Server1', usage: 0.4),
        ResourceUsageItem(name: 'Server2', usage: 0.7),
      ],
    );
  }
}

class ResourceUsageItem extends StatelessWidget {
  final String name;
  final double usage;

  const ResourceUsageItem({required this.name, required this.usage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: LinearProgressIndicator(
              value: usage,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkMetrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MetricItem(label: 'Latency', value: '20.5 ms'),
        MetricItem(label: 'Bandwidth', value: '50 Mbps'),
        MetricItem(label: 'Network Load', value: '30%'),
      ],
    );
  }
}

class MetricItem extends StatelessWidget {
  final String label;
  final String value;

  const MetricItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 10.0),
          Text(value),
        ],
      ),
    );
  }
}
