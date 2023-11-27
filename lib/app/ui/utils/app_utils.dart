import 'package:example_print_data_tdc/app/data/models/class/person_model.dart';
import 'package:example_print_data_tdc/app/data/services/reqres_services.dart';

class AppUtils {
  ServicesReqresApi servicesReqresApiInstance = ServicesReqresApi();

  Future<List<Persona>> misPersonas() async {
    List<Persona> misPersonas =
        await servicesReqresApiInstance.getReqRespServiceListUsers(2);

    return misPersonas;
  }
}
