//
//  CheckoutView.swift
//  Teriyaki
//
//  Created by dazn311 on 08.02.2023.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
                Text("Сенсонкас")
                    .foregroundColor(Color(red: 205 / 255, green: 91 / 255, blue: 15 / 255)) // If you have this
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                    .padding(.horizontal,0)
                Text("Морской окунь в панировке, рис, салат из капусты, дайкон маринованный, фасоль.350gr салат из капусты, дайкон маринованный, фасоль.350gr..салат из капусты, дайкон маринованный, фасоль.350gr")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal,0)
                    .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .topLeading)
                    .lineLimit(3)
            
        }
        .padding(.horizontal)
        .frame(minHeight: 128, maxHeight: 128, alignment: .leading)
        .onAppear {
            print("task:")
//                                if tabStateVM.currSubCategory == categ.id {
//                tabStateVM.topChange(id: categ.id)
//                                }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}

//Your Personal Details
//First Name
//E-Mail
//Telephone
//Enter street, house, apt.
//Payment on delivery
//
//В стоимость заказа не входит доставка
//
//Вы самостоятельно оплачиваете при получени
//
// Payment to the restaurant - 0P
//Add Comments About Your Order
//ready 1000
//index.php?route=checkout/checkout:653 ajax1 route=checkout/login #collapse-checkout-option .panel-body 1010
//index.php?route=checkout/checkout:745 $(document).delegate(#button-account, click
//index.php?route=checkout/checkout:746 ajax4 route=checkout/guest #collapse-payment-address .panel-body 1001
//index.php:1 [DOM] Password field is not contained in a form: (More info: https://goo.gl/9p2vKq) <input type=​"password" name=​"password" value placeholder=​"Password" id=​"input-password" class=​"form-control">
//index.php?route=checkout/checkout:1211 ajax19 route=checkout/guest/save 1007
//index.php?route=checkout/checkout:1255  if shipping_required 1008
//index.php?route=checkout/checkout:1260 ajax20 route=checkout/shipping_method #collapse-shipping-address .panel-body 1008
//index.php?route=checkout/checkout:1336 endif of - if shipping_required 1010
//index.php?route=checkout/checkout:1269 ajax21 route=checkout/guest_shipping #collapse-shipping-address .panel-body 1008
//index.php?route=checkout/checkout:1297 collapse-shipping-method 888
//ajax25 route=checkout/shipping_method/save 1010
//index.php?route=checkout/checkout:1446 ajax26 route=checkout/payment_method #collapse-payment-method .panel-body 1010
//ajax27 route=checkout/payment_method/save 1010
//index.php?route=checkout/checkout:1507 ajax28 route=checkout/confirm #collapse-checkout-confirm .panel-body 1010

//index.php?route=checkout/login    XHRindex.php?route=checkout/guest    XHRindex.php?route=checkout/checkout/customfield&customer_group_id=1    XHRindex.php?route=checkout/checkout/country&country_id=176    XHRindex.php?route=checkout/guest/save    XHRindex.php?route=checkout/shipping_method    XHRindex.php?route=checkout/guest_shipping    XHRindex.php?route=checkout/shipping_method/save    XHRindex.php?route=checkout/payment_method
//index.php?route=checkout/payment_method/save    XHRindex.php?route=checkout/confirm

//
//<form action="https://wl.walletone.com/checkout/checkout/Index" id="w1_checkout" method="post">
//    <input type="hidden" name="CMS" value="15">
//    <input type="hidden" name="WMI_CULTURE_ID" value="ru-RU">
//    <input type="hidden" name="WMI_CURRENCY_ID" value="643">
//    <input type="hidden" name="WMI_CUSTOMER_EMAIL" value="alex2505@bk.ru">
//    <input type="hidden" name="WMI_CUSTOMER_FIRSTNAME" value="Александр">
//    <input type="hidden" name="WMI_CUSTOMER_LASTNAME" value="Рыженков">
//    <input type="hidden" name="WMI_DESCRIPTION" value="BASE64:0J7Qv9C70LDRgtCwINC30LAg0LfQsNC60LDQtyDihJY0MjEg0L3QsCDRgdCw0LnRgtC1IFRlcml5YWtp">
//    <input type="hidden" name="WMI_EXPIRED_DATE" value="2023-06-04T08:55:28">
//    <input type="hidden" name="WMI_FAIL_URL" value="https://teriyaki.su/index.php?route=extension/payment/w1/resultpayment&amp;id_order=421">
//    <input type="hidden" name="WMI_MERCHANT_ID" value="187229354626">
//    <textarea name="WMI_ORDER_ITEMS" style="display: none;">[{"Title":"So GalBi","Quantity":"2.000","UnitPrice":"2600.00","SubTotal":"5200.00","TaxType":"tax_ru_1","Tax":"0.00"}]</textarea>
//    <input type="hidden" name="WMI_PAYMENT_AMOUNT" value="5200.00">
//    <input type="hidden" name="WMI_PAYMENT_NO" value="421_teriyaki.su">
//    <input type="hidden" name="WMI_RECIPIENT_LOGIN" value="alex2505@bk.ru">
//    <input type="hidden" name="WMI_SUCCESS_URL" value="https://teriyaki.su/index.php?route=extension/payment/w1/resultpayment&amp;id_order=421">
//    <input type="hidden" name="WMI_PTENABLED" value="ApplePayRUB">
//    <input type="hidden" name="WMI_PTENABLED" value="CreditCardEUR">
//    <input type="hidden" name="WMI_PTENABLED" value="CreditCardRUB">
//    <input type="hidden" name="WMI_PTENABLED" value="CreditCardUSD">
//    <input type="hidden" name="WMI_SIGNATURE" value="03UYqWzcZa90tMawjTUvIA==">
//  <div class="buttons">
//    <div class="pull-right">
//      <input type="submit" value="Confirm Order" id="button-confirm" class="btn btn-primary">
//    </div>
//  </div>
//</form>
