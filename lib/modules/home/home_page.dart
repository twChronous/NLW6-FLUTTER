import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  var pages= [
    Container( color: Colors.black),
    Container( color: Colors.blue),
    Container( color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Olá, ", 
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: "Usuario", 
                      style: TextStyles.titleBoldBackground
                      )
                  ]
                )
              ),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: TextStyles.captionShape,
                ),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:  BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        )
        ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(
              onPressed: () {
                setState(() {});
                homeController.setPage(0);
              }, 
              icon: const Icon(
                Icons.home,
                color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  Navigator.pushNamed(context, "/barcode_scanner");
                },
                child: Container(
                    width: 56,
                    height: 56,
                    decoration:  BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    ),
                  ),
              ),
            IconButton(
              onPressed: () {
                setState(() {});
                homeController.setPage(2);
              },
              icon: const Icon(
                Icons.description_outlined,
                color: AppColors.body,
                ),
              ),
          ]
        ),
      )
    );
  }
}