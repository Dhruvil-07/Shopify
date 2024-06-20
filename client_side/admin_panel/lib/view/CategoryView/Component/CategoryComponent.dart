import 'dart:io';
import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/Utils/snakbar.dart';
import 'package:admin_panel/model/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';


class CategorySubmitForm extends StatefulWidget {
  final CategoryModel? category;
  CategorySubmitForm({super.key, this.category});

  @override
  State<CategorySubmitForm> createState() => _CategorySubmitFormState();
}

class _CategorySubmitFormState extends State<CategorySubmitForm> {

  var CategoryFormKey = GlobalKey<FormState>();
  TextEditingController CategorynameController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  XFile? imageData;
  File? showenimg;
  
  Future<void> SelectImage() async
  {
     try
     {
        XFile? pickedimg = await imagePicker.pickImage(source: ImageSource.gallery);
        if(pickedimg != null)
        {
          setState(() {
            imageData = pickedimg;
            showenimg = File(pickedimg!.path);
          });
        }
     }
     catch(e)
     {
       print(e);
     } 
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: CategoryFormKey,
        child: Container(
          padding: EdgeInsets.all(12.0),
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(8.0),

              InkWell(
                onTap: () {
                  SelectImage();
                },
                child: Card(
                    child: Container(
                      height: 130,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          imageData != null ?

                          ClipRRect(
                            child: Image.network(showenimg!.path,
                              width: double.infinity,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          )

                          :

                          ClipRRect(
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt, size: 50, color: Colors.grey[600]),
                                SizedBox(height: 8),
                                Text(
                                  "Category",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ),

              Gap(8.0),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Category Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  controller: CategorynameController,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                    {
                      return "Enter Name";
                    }
                  },
                ),
              ),

              Gap(8.0* 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey.shade400,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                    child: Text('Cancel'),
                  ),
                  Gap(12.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if(imageData == null)
                      {
                          ShowSnakbar(context, "Select Image");
                      }
                      else if(CategoryFormKey.currentState!.validate())
                      {
                          Map<String,String> data =
                          {
                             "name" : CategorynameController.text.toString(),
                          };

                          categoryController.PostNewCategory(context, data, imageData);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void showAddCategoryForm(BuildContext context, CategoryModel? category) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade300,
        title: Center(child: Text('Add Category'.toUpperCase(), style: TextStyle(color: Colors.black))),
        content: CategorySubmitForm(category: category),
      );
    },
  );
}
