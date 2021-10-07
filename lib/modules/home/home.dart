import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slipflow/models/my_boletos/my_boletos.dart';
import 'package:slipflow/models/user_model.dart';
import 'package:slipflow/modules/extract_page/extract_page.dart';
import 'package:slipflow/modules/home/home_controller.dart';
import 'package:slipflow/shared/auth/auth_controller.dart';
import 'package:slipflow/shared/theme/colors.dart';
import 'package:slipflow/shared/theme/textstyles.dart';
import 'package:slipflow/shared/widgets/boleto_list/boleto_list_controller/boleto_list._controller.dart';

class Home extends StatefulWidget {
  User usermodel;
  Home({required this.usermodel});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthController authController = AuthController();
  HomeController controller = HomeController();
  BoletoListController bcontroller = BoletoListController();

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.shape,
      appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorPrimary,
              /*    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)), */
            ),
            child: Center(
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: 'Olá, ',
                    style: AppTextStyles.hellotext,
                    children: [
                      TextSpan(
                          text: widget.usermodel.displayNome,
                          style: AppTextStyles.nameText),
                    ])),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                      widget.usermodel.photoUrl!,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  IconButton(
                      onPressed: () {
                        authController.logout(context);
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ))
                ]),
                subtitle: Text(
                  "Mantenha seus boletos em dia !",
                  style: AppTextStyles.subbtitleText,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(152)),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    controller.changePage(0);
                  });
                },
                icon: Icon(Icons.home,
                    color: controller.currentPage == 0
                        ? AppColors.colorPrimary
                        : AppColors.body)),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, '/barcodescanner');
                setState(() {
                  
                  bcontroller = new BoletoListController();
                });
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.colorPrimary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    controller.changePage(1);
                  });
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1
                      ? AppColors.colorPrimary
                      : AppColors.body,
                )),
          ],
        ),
      ),
      body: [
        MyBoletoPage(
          controller: bcontroller,
        ),
        ExtractPage(
          controller: bcontroller,
        ),
      ][controller.currentPage],
    );
  }
}
