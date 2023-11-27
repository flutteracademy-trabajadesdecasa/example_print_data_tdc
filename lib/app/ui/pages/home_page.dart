import 'package:example_print_data_tdc/app/data/models/class/person_model.dart';
import 'package:example_print_data_tdc/app/ui/utils/app_utils.dart';
import 'package:example_print_data_tdc/app/ui/widgets/data_example_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Persona> misPersonas = [];

  returnMisPersonas() async {
    misPersonas = await AppUtils().misPersonas();

    setState(() {});
  }

  @override
  void initState() {
    returnMisPersonas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<Persona> misFake = await AppUtils().misPersonas();
          setState(() {});
          print(misFake);
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Cómo reproducir datos',
        ),
      ),
      body: DataExampleWidget(
        misPersonas: misPersonas,
      ),
    );
  }
}
