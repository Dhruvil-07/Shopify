import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/Utils/Text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {

  @override
  void initState() {
    super.initState();
    productController.GetAllProduct(context);
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
                       TextStructure(Msg: "DashBoard", size: 30.0),
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
                                    child: TextStructure(Msg: "My Product", size: 18.0),
                                  ),


                                  ElevatedButton.icon(
                                        onPressed: (){},
                                        icon: Icon(Icons.add),
                                        label: Text("New Add"),
                                  ),

                                  Gap(20.0),

                                  IconButton(
                                      onPressed: (){
                                        productController.GetAllProduct(context);
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
                                     child: TextStructure(Msg: "All Product", size: 20.0),
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
                                                  label: Text("Product Name"),
                                                ),
                                                DataColumn(
                                                  label: Text("Category"),
                                                ),
                                                DataColumn(
                                                  label: Text("Sub Category"),
                                                ),
                                                DataColumn(
                                                  label: Text("Price"),
                                                ),
                                                DataColumn(
                                                  label: Text("Edit"),
                                                ),
                                                DataColumn(
                                                  label: Text("Delete"),
                                                ),
                                              ],
                                              rows: List.generate(productController.ProductData.length, (index){
                                                return DataRow(cells: [
                                                  DataCell(Text('${productController.ProductData[index].name}')),
                                                  DataCell(Text('${productController.ProductData[index].proCategoryId.name}')),
                                                  DataCell(Text('${productController.ProductData[index].proSubCategoryId.name}')),
                                                  DataCell(Text('${productController.ProductData[index].price}')),
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
