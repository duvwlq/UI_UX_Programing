import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SalaryCalendarPage(),
    );
  }
}

class SalaryCalendarPage extends StatefulWidget {
  @override
  _SalaryCalendarPageState createState() => _SalaryCalendarPageState();
}

class _SalaryCalendarPageState extends State<SalaryCalendarPage> {
  late Map<DateTime, double> _salaries;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _salaries = {};
    _selectedDay = DateTime.now();
    _loadSalaries();
  }

  Future<void> _loadSalaries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? salariesString = prefs.getString('salaries');
    if (salariesString != null) {
      setState(() {
        _salaries = Map<DateTime, double>.from(
          salariesString.split(',').fold<Map<DateTime, double>>({}, (prev, String pair) {
            final parts = pair.split(':');
            prev[DateTime.parse(parts[0])] = double.parse(parts[1]);
            return prev;
          }),
        );
      });
    }
  }

  Future<void> _saveSalaries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final salariesString = _salaries.entries.map((e) => '${e.key.toIso8601String()}:${e.value}').join(',');
    await prefs.setString('salaries', salariesString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Calendar')
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              _showInputDialog(selectedDay);
            },
            eventLoader: (day) {
              return _salaries.containsKey(day) ? [ _salaries[day]! ] : [];
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  double salary = events.first as double;
                  return Positioned(
                    bottom: 1,
                    child: Text(
                      '${salary.toStringAsFixed(2)} 원',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          Expanded(
              child:  Text('이번달에 번 돈: \$${_calculateTotalSalary().toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }

  Future<void> _showInputDialog(DateTime date) async {
    double salary = 0.0; // 초기화
    double? result = await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Salary'),
          content: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: '돈을 입력하세요'),
            onChanged: (value) {
              salary = double.tryParse(value) ?? 0.0;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(salary);
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _salaries[date] = result;
        _saveSalaries();
      });
    }
  }

  double _calculateTotalSalary() {
    double totalSalary = 0.0;
    _salaries.forEach((date, salary) {
      totalSalary += salary;
    });
    return totalSalary;
  }

}


