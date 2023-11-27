import 'package:example_print_data_tdc/app/data/models/class/person_model.dart';
import 'package:flutter/material.dart';

class DataExampleWidget extends StatelessWidget {
  final List<Persona> misPersonas;
  const DataExampleWidget({
    Key? key,
    required this.misPersonas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: misPersonas.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network('${misPersonas[index].avatar}'),
            const SizedBox(
              height: 20,
            ),
            Text(misPersonas[index].firstName ?? 'No hay datos'),
            Text(misPersonas[index].email ?? 'No hay datos'),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
