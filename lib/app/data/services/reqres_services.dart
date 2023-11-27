import 'dart:convert';

import 'package:example_print_data_tdc/app/data/models/class/person_model.dart';
import 'package:example_print_data_tdc/app/data/models/json/person_model_fake.dart';
import 'package:http/http.dart' as http;

class ServicesReqresApi {
  List<Persona> personsModel = [];
  Persona person = Persona();
  PersonaDTO personDTO = PersonaDTO();

  Future<List<Persona>> getReqRespServiceListUsers(
    int page, {
    Persona? persona,
  }) async {
    Uri httpsUri = Uri(
      scheme: 'https',
      host: 'reqres.in',
      path: '/api/users',
      queryParameters: {
        "page": "$page",
      },
    );

    print(httpsUri);

    await http
        .get(
      httpsUri,
    )
        .then((response) {
      print(response);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> resultPersonsBody = jsonDecode(response.body);

        print(resultPersonsBody);

        print(resultPersonsBody["data"]);

        List<dynamic> resultPersons = resultPersonsBody["data"];

        print(resultPersons);

        ResponseListPersons responseApiPersons =
            ResponseListPersons.fromJson(resultPersonsBody);

        if (responseApiPersons.data != null ||
            responseApiPersons.data!.isNotEmpty) {
          personsModel = responseApiPersons.data!;
        }
      }
    });
    return personsModel;
  }

  Future<Persona> getSinglePerson() async {
    String url = "https://reqres.in/api/users/2";
    Uri uriPersonUrl = Uri.parse(url);

    await http.get(uriPersonUrl).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> resultPerson = jsonDecode(response.body);
        print(response.body);
        person = Persona.fromJson(resultPerson["data"]);
      }
    });
    return person;
  }

  Future<PersonaDTO> getSinglePersonDTO() async {
    // String url = "https://reqres.in/api/users/2";

    // Uri uriPersonUrl = Uri(
    //   scheme: 'https',
    //   host: 'reqres.in',
    //   path: '/api/users/2',
    // );

    // await http.get(uriPersonUrl).then((response) {
    //   if (response.statusCode == 200) {
    //     Map<String, dynamic> resultPerson = jsonDecode(response.body);
    //     print(response.body);
    //     personDTO = PersonaDTO.fromJson(resultPerson);
    //   }
    // });

    personDTO = MockPersons.myPersonFake;
    return personDTO;
  }
}
