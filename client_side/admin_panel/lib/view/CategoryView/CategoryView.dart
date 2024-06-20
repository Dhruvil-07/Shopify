import 'package:admin_panel/controller/CategoryController.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Utils/Instances.dart';
import '../../Utils/Text.dart';
import 'Component/CategoryComponent.dart';


class Categoryview extends StatefulWidget {
  const Categoryview({Key? key}) : super(key: key);

  @override
  State<Categoryview> createState() => _CategoryviewState();
}

class _CategoryviewState extends State<Categoryview> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.GetAllCategory(context);
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
                      TextStructure(Msg: "Category", size: 30.0),
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
                                child: TextStructure(Msg: "My Category", size: 18.0),
                              ),


                              ElevatedButton.icon(
                                onPressed: (){
                                  showAddCategoryForm(context,null);
                                },
                                icon: Icon(Icons.add),
                                label: Text("New Add"),
                              ),

                              Gap(20.0),

                              IconButton(
                                onPressed: (){
                                  categoryController.GetAllCategory(context);
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
                                  child: TextStructure(Msg: "All Category", size: 20.0),
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
                                              label: Text("Category Name"),
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
                                          rows: List.generate(categoryController.CategoryData.length, (index){
                                            return DataRow(cells: [
                                              DataCell(
                                                Row(
                                                  children: [
                                                    Image.network(
                                                      categoryController.CategoryData[index].image ?? '',
                                                      height: 30,
                                                      width: 30,
                                                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                        return Icon(Icons.error);
                                                      },
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Text(categoryController.CategoryData[index].name),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              DataCell(Text('${categoryController.CategoryData[index].updatedAt}')),
                                              DataCell(IconButton(icon: Icon(Icons.edit) , onPressed: (){},)),
                                              DataCell(IconButton(icon: Icon(Icons.delete , color: Colors.red,) , onPressed: (){

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
