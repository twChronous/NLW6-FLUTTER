import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/models/user_module.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  var pages= [
     SingleChildScrollView(
       child: Column(
         children: [
           MeusBoletosPage(
            key: UniqueKey()
         ),
         ],
       ),
     ),
    const ExtractPage(),
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
                      text: widget.user.name, 
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
                  borderRadius:  BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoUrl!)
                    ),
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
                homeController.setPage(0);
                setState(() {});
              }, 
              icon: const Icon(
                Icons.home,
                color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
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
                homeController.setPage(1);
                setState(() {});
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