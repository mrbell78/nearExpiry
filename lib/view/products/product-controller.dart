import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:near_expiry/locator/locator.dart';
import 'package:near_expiry/view/login/model/custommer-login.dart';
import 'package:near_expiry/view/products/product-repository.dart';
import 'package:near_expiry/view/products/model/related-product-you-may-like.dart';
import 'package:near_expiry/view/profile/model/delivery-address.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add-to-cartlist.dart';
import 'model/add-to-cart-responsedata.dart';
import 'model/add-to-cartlistResponseData.dart';
import 'model/body/body-order.dart';
import 'model/order-checkout-responsedata.dart';
import 'model/parent-category-response-data.dart';
import 'model/product-details.dart';
import 'model/product-response-data.dart';
import 'model/product-details.dart' as subskuedetails;

import 'model/body/body-order.dart' as listmaker;
import 'model/recently-ordered-items.dart';
import 'model/remove-all-cart.dart';
import 'model/sub-category-item-list.dart';
import 'model/trending-slider.dart';

class ProductController extends  ChangeNotifier{

  var _store_repo = locator<ProductRepository>();

  List<ParentCategory?> parentCategoryList=[];
  List<ProductResponseData?> productList=[];

  List<listmaker.InvoiceDetailsRequestModels> ?invoicerequestModel=[];
  List<listmaker.BillingShippingAddressRequestModels> billingShipiungaddressModel=[];

  List<listmaker.PaymentRequestModels>paymentRequestModel=[];
  List<YouMayLikeReletedProduct?>relatedProductList=[];

  subskuedetails.ProductSubSkuRequestModel? productSubSkuRequestModel;

  AddtoCartResponseData? addtoCartResponseData;

  ProductDetails? productDetails;

  CustommerLogin ?loingdataObject;

  List<TrendingSlider?> trendingList=[];
  List<RecentlyOrdereedItems?> recentlyOrderedItemsList=[];
  List<SubCategoryItemList?> subCategoryItemList=[];

  CustommerLogin? custommerLogin;


  bool _isloading=false;


  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  List<AddtoCartListResponseData?> addtoCartList=[];

  RemoveAllCart? removeAllCart;

  bool isLoading=true;

  List<bool>_isExpand=[];
  List<bool>_isSelected=[];


  List<bool> get isSelected => _isSelected;

  set isSelected(List<bool> value) {
    _isSelected = value;
    notifyListeners();
  }

  List<bool> get isExpand => _isExpand;

  set isExpand(List<bool> value) {
    _isExpand = value;
    notifyListeners();
  }


  int _singleSelect=0;


  int get singleSelect => _singleSelect;

  set singleSelect(int value) {
    _singleSelect = value;
    notifyListeners();
  }

  List<int>_singleTry=[];


  List<int> get singleTry => _singleTry;

  set singleTry(List<int> value) {
    _singleTry = value;
    notifyListeners();
  }

  List<int>_productUnit=[];

  List<String>combinationValue=[];

  List<int> get productUnit => _productUnit;

  set productUnit(List<int> value) {
    _productUnit = value;
    notifyListeners();
  }


  List<subskuedetails.AttributeRequestModel>atRequestModelList=[];
  List<subskuedetails.AttributeDetailsRequestModel>atRequestDetailsList=[];

  List<DeliveryAddress?> deliveryAddresslist=[];


  subskuedetails.ProductSubSkuRequestModel? skuRequestModel;
  getProductParentCategory(int  languageId,)async{
    isloading=true;
    var apiresponse = await _store_repo.getProductParentCategory(languageId);

    if(apiresponse.httpCode==200){
      parentCategoryList.clear();
      parentCategoryList.addAll(apiresponse.data);
      isloading=false;
    }

    notifyListeners();

  }

/*
  getUnit( list){

    list.forEach((element) {
      productUnit.add(element.quantity!=null?element.quantity:0);
    });


  }*/

  Future<bool> getProducts(int  languageId,int productTypeid, int countryId,int currencyId,)async{
    isloading=true;
    var apiresponse = await _store_repo.getProducts(languageId,productTypeid,countryId,currencyId,);

    if(apiresponse.httpCode==200){
      productList.clear();
      productList.addAll(apiresponse.data);
      isLoading=false;

      productList.forEach((element) {

        productUnit.add(1);



      });

      isloading=false;

      notifyListeners();
      return true;

    }else return false;



  }



  Future<bool> getProductsbyCategory(int  languageId,int productTypeid, int countryId,int currencyId,int categoryId)async{
    isloading=true;
    var apiresponse = await _store_repo.getProductsbyCategory(languageId,productTypeid,countryId,currencyId,categoryId);

    if(apiresponse.httpCode==200){
      productList.clear();
      productList.addAll(apiresponse.data);
      isLoading=false;

      productList.forEach((element) {

        productUnit.add(1);



      });

      isloading=false;
      notifyListeners();
      return true;

    }else return false;



  }


  getProductDetails(int id,int  languageId,int countryId,int currencyId,customerId)async{
    var apiresponse = await _store_repo.getProductDetails(id,languageId,countryId,currencyId,customerId);

    if(apiresponse.httpCode==200){

      productDetails=apiresponse.data;
      isLoading=false;
      atRequestDetailsList.clear();

      skuRequestModel= productDetails!.productSubSkuRequestModels[0];

      productDetails!.productSubSkuRequestModels.forEach((element) {


        combinationValue.add(element.attributeCombination);


      });

      initilaCombination();
    }

    selectionOperation();
    notifyListeners();
  }



 Future<bool> addToCart(data)async{
    var apiresponse = await _store_repo.addTocartPost(data);

    if(apiresponse.httpCode==200){

      addtoCartResponseData=apiresponse.data;
      return true;

    }else return false;
    notifyListeners();
  }

  List<double> _incrementer=[];


  List<double> get incrementer => _incrementer;

  set incrementer(List<double> value) {
    _incrementer = value;
    notifyListeners();
  }

  getCartItems(int customerId,)async{

    await getTemptId().then((value)async{

      print("custommerId: ${customerId}");
      print("TemptId: ${value}");

      var apiresponse = await _store_repo.getCartItems(customerId,value);

      if(apiresponse.httpCode==200){
        addtoCartList.clear();
        addtoCartList.addAll(apiresponse.data);

        addtoCartList.forEach((element) {
          isExpand.add(false);
        });
      }
      addtoCartList.forEach((element) {incrementer.add(element!.quantity);});
    } );


    notifyListeners();
  }

  //var invoicenumber;

  MyOrderCheckOut? myOrderCheckOut;

  Future<bool> orderCheckout(BodyOrder data)async{

    var apiresponse = await _store_repo.checkOutOrder(data);
    print("${apiresponse.data}");

    if(apiresponse.httpCode==200){
      myOrderCheckOut=apiresponse.data;
      return true;
    }else return false;



  }




  double getTotalAmmountforCheckOut(List<AddtoCartListResponseData?> productList){

    double totalammount=0;
    productList.forEach((element) {

      totalammount=totalammount+element!.price;
      print("the total amout is ${totalammount}");

    });
    print("the total amount final ${totalammount}");
    return totalammount;
  }



  double price=0;

  List<String> skqueinit=[];
  List<String> skquvalue=[];

  initilaCombination(){

    productDetails!.attributeRequestModels.forEach((element) {
      skqueinit.add(element.skuInitials);
      element.attributeDetailsRequestModels.forEach((element) {

        skquvalue.add(element.value);



      });
    });

  //  print("initcom=${skqueinit[0]+skquvalue[0]}   ${skqueinit[1]+skquvalue[1]}");
  }

  getskuePrice(int index,int i,){

    double price=0.0;
    String comb1=skqueinit[index]+":"+skquvalue[i];




    print("new Combination ${comb1}");

    productDetails!.productSubSkuRequestModels.forEach((element) {

      if(element.attributeCombination.contains(comb1)){
        print("String found ${element}     ${comb1}");

        skuRequestModel = element;
        notifyListeners();

      }else{
        print("String not matched ${element}     ${comb1}");
        skuRequestModel=null;
      }

    });


    print("the skue price is ${price}");

    notifyListeners();
   // print("actual combinatrion "+combination);

  }

  int createTempId(){
 /*   Random random = new Random();
    int randomNumber = random.nextInt(100);
    return randomNumber;*/


    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    int rNum = min + randomizer.nextInt(max - min);

    print(rNum);
    return rNum;
  }


  Future<bool> getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginData = (prefs.getString('logininfo') ?? "") ;

    if(loginData!=null && loginData.isNotEmpty){

      print("the data is ${loginData}");

      Map<String,dynamic> mapdata= jsonDecode(loginData);



      custommerLogin  =CustommerLogin.fromJson(mapdata);
      notifyListeners();
      return true;

    }else return false;

  }

  setTemptId(int counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('counter', counter);
  }

// just recommit again

  Future<String> getTemptId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) ;
    print('tempid is $counter');

    if(counter!=null && counter>0){
      return counter.toString();
    }else {
     int newTemtId = createTempId();

     setTemptId(newTemtId);

     return newTemtId.toString();
    }

  }


  var _tList =[[]];



  get tList => _tList;

  set tList(value) {
    _tList = value;
    notifyListeners();
  }


  late List<List<int>>darry=[[]];

  List<int>oarry=[];


  int i=0;



  selectionOperation(){
    print("Combination vlaue ${combinationValue}");
    print("parent size${productDetails!.attributeRequestModels.length}");
    print("child size${atRequestDetailsList.length}");


    //print("combination is${combination}");


    tList = List.generate(productDetails!.attributeRequestModels.length, (i) => List.filled(atRequestDetailsList.length,i ,growable: false), growable: false);

    //print("the daray value is ${tList}");


    for(int i=0;i<productDetails!.attributeRequestModels.length;i++){

      for(int j=0;j<atRequestDetailsList.length;j++){

        tList[i][j]=j;


      }

      singleTry.add(5);

    }


    print("arryvalue: ${tList}");



  }


  Future<bool> deleteSingleCartItem(int cartId)async{


    var apiresponse = await _store_repo.deleteCartItem(cartId);

    if(apiresponse.httpCode==200){
      return true;
    }else return false;

  }


  Future<bool>  getDeliveryAddress(int custommerId)async{
    var apiresponse = await _store_repo.getDeliveryAddress(custommerId);
    if(apiresponse.httpCode==200){
      deliveryAddresslist.clear();
      deliveryAddresslist.addAll(apiresponse.data);
      notifyListeners();
      return true;
    }else return false;



  }


  /*getSameElemnt(List<AddtoCartListResponseData?> addtoCartListLocal){


    tList = List.generate(productDetails!.attributeRequestModels.length, (i) => List.filled(atRequestDetailsList.length,i ,growable: false), growable: false);




    print("all  suplier id is = $data");
    data = data.toSet().toList();
   print("different  suplier id is = $data");






  *//* addtoCartList.forEach((element) {


     for(int i=0;i<data.length;i++){


       adb.add(addtoCartList.where((element) => element!.supplierId==data[i]).toList());
     }

   });*//*





  }*/


  List<InvoiceRequestModels> getInvoiceRequestModel( List<AddtoCartListResponseData?> addtoCartListLocal,totalAmount){

    List<InvoiceRequestModels>? invoiceRequestModels=[];

    List<int>data=[];
    List<List<AddtoCartListResponseData?>> NumberofListVarible=[[]];
    addtoCartListLocal.forEach((element) {

      data.add(element!.supplierId);

    });

    data=data.toSet().toList();

    for(int i=0;i<data.length;i++){

      List<AddtoCartListResponseData>temptList=[];

      addtoCartListLocal.forEach((element) {

        if(data[i]==element!.supplierId){

          temptList.add(element);

        }


      });

      if(temptList.length>0){
        NumberofListVarible.add(temptList);
      }

    }


    for(int j=0;j<NumberofListVarible.length;j++){


      NumberofListVarible[j].forEach((element) {


        invoicerequestModel!.add(listmaker.InvoiceDetailsRequestModels(
            createdAt: null,
            status: null,
            invoiceId: 0,
            quantity: element!.quantity.floor(),
            productSubSKUId:element!.productSubSkuId,
            price: element!.price,
            productMasterId: element!.productMasterId,
            invoiceDetailsId: 0

        ));


        print("supplier id of batch number ${element.supplierId}  ==  ${element.price}");


      });


      //print("Numberf of list variable  ==  ${adb[j].length}");


      invoiceRequestModels!.add(InvoiceRequestModels(
          carryingCost: 0,
          paymentMethod:1,
          courierCharge: 0,
          invoiceId: 0,
          supplierCommissionId: 0,
          amountToSupplier: 0,
          amountToAdmin: 0,
          serviceDateTime: null,
          totalAmount: getSubTotal(NumberofListVarible[j]),
          serviceTime: null,
          refNumber: null,
          invoiceMasterId: 0,
          invoiceDate: null,
          discountCode: 0,
          remark: null,
          paymentStatus: null,
          receivedAmt: getSubTotal(NumberofListVarible[j]),
          discountValue: 0,
          invoiceStatusId: 0,
          status: null,
          invoiceDetailsViewModels: [],
          createdAt: null,
          isDigitalProduct: null,
          isQuotationProduct: null,
          isService: null,
          serviceDate: null,
          storeId: productDetails!.storeId,
          supplierId: productDetails!.supplierRequestModel.supplierId,
          invoiceDetailsRequestModels: invoicerequestModel

      ));

    }






    return invoiceRequestModels;
  }

  getRelatedProductYoumayLike(int productMasterId,int languageId, int currencyId)async{

    var apiresponse = await _store_repo.getRelatedProductYoumayLike(productMasterId, languageId, currencyId);

    if(apiresponse.httpCode==200){
      relatedProductList.clear();
      relatedProductList.addAll(apiresponse.data);
      print("the data size is ${relatedProductList.length}");
    }


    notifyListeners();
  }


  getTrendingBanner()async{

    var apiresponse = await _store_repo.getTrendingSlider();

    if(apiresponse.httpCode==200){
      trendingList.clear();
      trendingList.addAll(apiresponse.data);
      print("the trending list size is ${trendingList.length}");
    }


    notifyListeners();
  }

  getRecentlyOrderedItems(int languageId,int productTypeId,int countryId,int currencyId)async{

    var apiresponse = await _store_repo.getRecentlyOrderedItems(languageId, productTypeId, countryId, currencyId);

    if(apiresponse.httpCode==200){
      recentlyOrderedItemsList.clear();
      recentlyOrderedItemsList.addAll(apiresponse.data);
      print("the recently Ordered Items list size is ${recentlyOrderedItemsList.length}");

      recentlyOrderedItemsList.forEach((element) {

        productUnit.add(1);

      });
    }


    notifyListeners();
  }


  getSubCategoryItem(int languageId)async{

    var apiresponse = await _store_repo.getSubCategoryItem(languageId);

    if(apiresponse.httpCode==200){
      subCategoryItemList.clear();
      subCategoryItemList.addAll(apiresponse.data);
      print("the subcategory item list size is ${subCategoryItemList.length}");
    }


    notifyListeners();
  }


 Future<bool> removeAllCartList(data)async{

    var apiresponse = await _store_repo.removeAllCart(data);

    if(apiresponse.httpCode==200){

      removeAllCart=apiresponse.data;
      return true;
    }else return false;


    notifyListeners();
  }

  double getSubTotal(List<AddtoCartListResponseData?> numberofListVarible) {

    double subtotal =0.0;

    numberofListVarible.forEach((element) {

      subtotal=subtotal+element!.price;

    });

    return subtotal;

  }



}