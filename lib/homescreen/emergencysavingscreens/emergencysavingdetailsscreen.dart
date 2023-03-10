import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// import 'package:get/get.dart';
import '../../colors/colors.dart';
import '../../routes/route_names.dart';
import '../../textfontfamily/textfontfamily.dart';

class EmergencySavingDetailScreen extends ConsumerStatefulWidget {
  const EmergencySavingDetailScreen({Key? key, required this.amount})
      : super(key: key);
  final String amount;

  @override
  ConsumerState<EmergencySavingDetailScreen> createState() =>
      _EmergencySavingDetailScreenState();
}

class _EmergencySavingDetailScreenState
    extends ConsumerState<EmergencySavingDetailScreen> {
  late TextEditingController _amountController,
      _phoneNumberController,
      _walletController,
      _targerAmountController,
      _nameController,
      _pinController;

  @override
  void initState() {
    _amountController = TextEditingController(text: widget.amount);
    _phoneNumberController = TextEditingController();
    _walletController = TextEditingController();
    _targerAmountController = TextEditingController();
    _nameController = TextEditingController();
    _pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _phoneNumberController.dispose();
    _walletController.dispose();
    _targerAmountController.dispose();
    _nameController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    // selectedIndex = 0;
                    context.goNamed(RouteName.homeScreen);
                    // Navigator.of(context, rootNavigator: true)
                    //     .pushReplacement(MaterialPageRoute(
                    //   builder: (context) => NavigationBarBottom(),
                    // ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ColorResources.white,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(height: 45),
              Container(
                color: ColorResources.grey1.withOpacity(0.05),
                child: TextFormField(
                  controller: _amountController,
                  style: TextStyle(
                    fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                    fontSize: 13,
                    color: ColorResources.grey2,
                  ),
                  cursorColor: ColorResources.blue1,
                  decoration: InputDecoration(
                    fillColor: ColorResources.grey1.withOpacity(0.05),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Amount",
                    labelStyle: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 15,
                      color: ColorResources.white,
                    ),
                    hintText: "₦1000",
                    hintStyle: TextStyle(
                      fontFamily: TextFontFamily.helveticaNeueCyrRoman,
                      fontSize: 13,
                      color: ColorResources.grey2,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorResources.blue1.withOpacity(0.6),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorResources.blue1.withOpacity(0.6),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorResources.blue1.withOpacity(0.6),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorResources.blue1.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              text("Phone number"),
              SizedBox(height: 10),
              textFormField("+ 234 808 762 1236", _phoneNumberController),
              SizedBox(height: 20),
              text("Wallet Name"),
              SizedBox(height: 10),
              textFormField("School Fees", _walletController),
              SizedBox(height: 20),
              text("Target amount"),
              SizedBox(height: 10),
              textFormField("Enter the amount you want to reach",
                  _targerAmountController),
              SizedBox(height: 20),
              text("Customer Name"),
              SizedBox(height: 10),
              textFormField("John Doe", _nameController),
              SizedBox(height: 20),
              text("Pin"),
              SizedBox(height: 10),
              textFormField("****", _pinController),
              SizedBox(height: size.height >= 876 ? 140 : 40),
              InkWell(
                onTap: () => context.goNamed(RouteName.congratulationsScreen),
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorResources.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontFamily: TextFontFamily.helveticNeueCyrBold,
                          fontSize: 15,
                          color: ColorResources.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontFamily: TextFontFamily.helveticaNeueCyrRoman,
        color: ColorResources.white,
      ),
    );
  }

  Container textFormField(String hint, TextEditingController controller) {
    return Container(
      color: ColorResources.grey1.withOpacity(0.05),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontFamily: TextFontFamily.helveticaNeueCyrRoman,
          fontSize: 13,
          color: ColorResources.grey2,
        ),
        cursorColor: ColorResources.blue1,
        decoration: InputDecoration(
          fillColor: ColorResources.grey1.withOpacity(0.05),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: TextFontFamily.helveticaNeueCyrRoman,
            fontSize: 13,
            color: ColorResources.grey2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 1,
              color: ColorResources.blue1.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
