import 'package:flutter/material.dart';
import 'package:flutter_project/view_model/company_vm.dart';
import 'package:provider/provider.dart';

class InfoSpaceX extends StatelessWidget {
  const InfoSpaceX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompanyViewModel(),
      child: Consumer<CompanyViewModel>(
        builder: (context, CompanyViewModel viewModel, child) => Scaffold(
            body: viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(

                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(" ${viewModel.company?.name}'s Informations", style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              )
                                  ),
                            ),
                          ],
                        ),
                        color: Colors.lightBlueAccent,
                        height: 45,
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const Padding(
                               padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                               child: Text(
                                "The company is located in  : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                            ),
                             ),
                            const Divider(
                              thickness: 2,
                              color: Colors.lightBlue,
                              indent: 0,
                              endIndent: 80,
                            ),
                            Container(

                              child: Text(
                        "${viewModel.company?.headquarters?.city}, in ${viewModel.company?.headquarters?.state} ",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              viewModel.company?.headquarters?.address ??
                                  "missing",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text(
                                "Founder : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.lightBlue,
                              indent: 0,
                              endIndent: 80,
                            ),
                            Container(

                              child: Text(
                                "${viewModel.company?.founder}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              " in ${viewModel.company?.founded.toString()}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text(
                                "Summary : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.lightBlue,
                              indent: 0,
                              endIndent: 80,
                            ),
                            Text(
                              "${viewModel.company?.summary}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text(
                                "Number of employees : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.lightBlue,
                              indent: 0,
                              endIndent: 80,
                            ),
                            Text(
                              "${viewModel.company?.employees}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text(
                                "Number of  launch sites : ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.lightBlue,
                              indent: 0,
                              endIndent: 80,
                            ),
                            Text(
                              "${viewModel.company?.launch_sites}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/SpaceX-Logo.png',
                        fit: BoxFit.fill,
                      ),

                    ],
                  )),
      ),
    );
  }
}
