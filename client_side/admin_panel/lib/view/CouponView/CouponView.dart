import 'package:admin_panel/Utils/Instances.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../Utils/Text.dart';

class CouponView extends StatefulWidget {
  const CouponView({Key? key}) : super(key: key);

  @override
  State<CouponView> createState() => _CouponViewState();
}

class _CouponViewState extends State<CouponView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    couponController.GetAllCoupon(context);
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
                      TextStructure(Msg: "Coupon", size: 30.0),
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
                                child: TextStructure(Msg: "My Coupons", size: 18.0),
                              ),


                              ElevatedButton.icon(
                                onPressed: (){},
                                icon: Icon(Icons.add),
                                label: Text("New Add"),
                              ),

                              Gap(20.0),

                              IconButton(
                                onPressed: (){
                                  couponController.GetAllCoupon(context);
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
                                  child: TextStructure(Msg: "All Coupons", size: 20.0),
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
                                              label: Text("Coupon Name"),
                                            ),
                                            DataColumn(
                                              label: Text("Status"),
                                            ),
                                            DataColumn(
                                              label: Text("Type"),
                                            ),
                                            DataColumn(
                                              label: Text("Amount"),
                                            ),
                                            DataColumn(
                                              label: Text("Edit"),
                                            ),
                                            DataColumn(
                                              label: Text("Delete"),
                                            ),
                                          ],
                                          rows: List.generate(couponController.CouponData.length, (index){
                                            return DataRow(cells: [
                                              DataCell(Text('${couponController.CouponData[index].couponCode}')),
                                              DataCell(Text('${couponController.CouponData[index].status}')),
                                              DataCell(Text('${couponController.CouponData[index].discountType}')),
                                              DataCell(Text('${couponController.CouponData[index].discountAmount}')),
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
