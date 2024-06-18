import 'package:admin_panel/Utils/Instances.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../Utils/Text.dart';

class BrandView extends StatefulWidget {
  const BrandView({Key? key}) : super(key: key);

  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brandController.GetAllBrands(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              //first row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: [
                      TextStructure(Msg: "Brand", size: 30.0),
                    ]
                ),
              ),

              Gap(5.0),

              //second row
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Expanded(
                      child: Column(
                        children: [

                          //first row
                          Row(
                            children: [

                              Expanded(
                                child: TextStructure(Msg: "My Brands", size: 18.0),
                              ),


                              ElevatedButton.icon(
                                onPressed: (){},
                                icon: Icon(Icons.add),
                                label: Text("New Add"),
                              ),

                              Gap(20.0),

                              IconButton(
                                onPressed: (){
                                  brandController.GetAllBrands(context);
                                },
                                icon: Icon(Icons.refresh),
                              ),
                            ],
                          ),

                          Gap(30.0),

                          //second row
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10.0,left: 15.0,
                                  ),
                                  child: TextStructure(Msg: "All Brands", size: 20.0),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Obx(
                                          (){
                                        return DataTable(
                                          columns: [
                                            DataColumn(
                                              label: Text("Brand Name"),
                                            ),
                                            DataColumn(
                                              label: Text("SubCategory"),
                                            ),
                                            DataColumn(
                                              label: Text("Added Date"),
                                            ),
                                            DataColumn(
                                              label: Text("Edit"),
                                            ),
                                            DataColumn(
                                              label: Text("Delete"),
                                            ),
                                          ],
                                          rows: List.generate(brandController.BrandData.length, (index){
                                            return DataRow(cells: [
                                              DataCell(Text('${brandController.BrandData[index].name}')),
                                              DataCell(Text('${brandController.BrandData[index].subcategoryId?.name}')),
                                              DataCell(Text('${brandController.BrandData[index].updatedAt}')),
                                              DataCell(IconButton(icon: Icon(Icons.edit) , onPressed: (){},)),
                                              DataCell(IconButton(icon: Icon(Icons.delete , color: Colors.red,) , onPressed: (){
                                                productController.DeleteProduct(context, index);
                                              },)),
                                            ]);
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
