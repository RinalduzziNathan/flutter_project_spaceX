
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/manager/company_manager.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/company.dart';

class CompanyViewModel extends ChangeNotifier{

  Company? company;
  bool isLoading = true;
  CompanyViewModel(){
   loadCompany();
  }
    Future<void> loadCompany() async {
     company = (await CompanyManager().loadCompanies())!;
     isLoading = false;
     notifyListeners();
   }

}