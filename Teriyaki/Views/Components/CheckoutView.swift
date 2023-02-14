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
            
                Text("Сенсонкас окунь в панировке окунь в панировке окунь в панировке окунь в панировке окунь в панировке")
                    .foregroundColor(Color(red: 205 / 255, green: 91 / 255, blue: 15 / 255)) // If you have this
                    .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .topLeading)
                    .padding(.horizontal,4)
                Text("Морской окунь в панировке, рис, салат из капусты, дайкон маринованный, фасоль.350gr салат из капусты, дайкон маринованный, фасоль.350gr..салат из капусты, дайкон маринованный, фасоль.350gr")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal,4)
                    .frame(maxWidth: .infinity, minHeight: 70, maxHeight: 70, alignment: .topLeading)
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

//for order23.php
//add: customer, payment_method, shipping_address, shipping_method
//

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//index.php?route=checkout/login    XHR index.php?route=checkout/guest    XHR index.php?route=checkout/checkout/customfield&customer_group_id=1    XHR index.php?route=checkout/checkout/country&country_id=176    XHR index.php?route=checkout/guest/save    XHR index.php?route=checkout/shipping_method    XHR index.php?route=checkout/guest_shipping    XHR index.php?route=checkout/shipping_method/save    XHR index.php?route=checkout/payment_method
//index.php?route=checkout/payment_method/save    XHR index.php?route=checkout/confirm

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



//Get: Request URL: https://teriyaki.su/index.php?route=checkout/login
//Checkout Options:
// Register Account
// Guest Checkout
//GET: https://teriyaki.su/index.php?route=checkout/guest
//First Name
//Last Name
//E-Mail
//Telephone

//GET: https://teriyaki.su/index.php?route=checkout/checkout/customfield&customer_group_id=1
//GET: https://teriyaki.su/index.php?route=checkout/checkout/country&country_id=176
//{
//    "country_id": "176",
//    "name": "Russian Federation",
//    "iso_code_2": "RU",
//    "iso_code_3": "RUS",
//    "address_format": "",
//    "postcode_required": "0",
//    "zone": [
//        {
//            "zone_id": "2761",
//            "country_id": "176",
//            "name": "Moscow",
//            "code": "MO",
//            "status": "1"
//        }
//    ],
//    "status": "1"
//}

//POST: https://teriyaki.su/index.php?route=checkout/guest/save
//customer_group_id:1
//firstname:Александр
//lastname:Рыженков
//email:alex2505@bk.ru
//telephone:+79850077750
//company:сс
//address_1:ул. Утренняя, д.4, кв.44
//address_2:аа
//city:Moscow
//postcode:125222
//country_id:176
//zone_id:2761
//shipping_address: 1

//GET: https://teriyaki.su/index.php?route=checkout/shipping_method
//GET: https://teriyaki.su/index.php?route=checkout/guest_shipping

//POST: https://teriyaki.su/index.php?route=checkout/shipping_method/save
//shipping_method:free.free
//comment:


//GET: https://teriyaki.su/index.php?route=checkout/payment_method
//Add Comments About Your Order
//I have read and agree to the Terms & Conditions




//POST: https://teriyaki.su/index.php?route=checkout/payment_method/save
//payment_method: w1
//comment:
//agree: 1

//GET: https://teriyaki.su/index.php?route=checkout/confirm
//Product Name    Q-ty    Unit Price    Total
//So GalBi    2    2600P    5200P
//Sub-Total:    5200P
//Total:    5200P

//GET: https://teriyaki.su/index.php?route=extension/payment/w1/confirm
//POST: https://www.google-analytics.com/j/collect?v=1&_v=j99&a=809790581&t=pageview&_s=1&dl=https%3A%2F%2Fwl.walletone.com%2Fcheckout%2Frefill%2FCreditCard%2F328924577%2FNewCard&ul=en-us&de=UTF-8&sd=24-bit&sr=5120x1440&vp=2581x670&je=0&_u=AACAAEABAAAAACAAI~&jid=1987637392&gjid=282364846&cid=367969754.1673995607&tid=UA-48755948-1&_gid=43917723.1675867742&_r=1&_slc=1&z=108073497

//v:1
//_v:j99
//a:809790581
//t:pageview
//_s:1
//dl:https%3A%2F%2Fwl.walletone.com%2Fcheckout%2Frefill%2FCreditCard%2F328924577%2FNewCard
//ul:en-us
//de:UTF-8
//sd:24-bit
//sr:5120x1440
//vp:2581x670
//je:0
//_u:AACAAEABAAAAACAAI~
//jid:1987637392
//gjid:282364846
//cid:367969754.1673995607
//tid:UA-48755948-1
//_gid:43917723.1675867742
//_r:1
//_slc:1
//z:108073497

//response: 2d,x

//GET: https://mc.yandex.ru/watch/24181150?wmode=7&page-url=https%3A%2F%2Fwl.walletone.com%2Fcheckout%2Frefill%2FCreditCard%2F328924577%2FNewCard&page-ref=https%3A%2F%2Fwl.walletone.com%2Fcheckout%2Fcheckout%2FLogin%3Fi%3D350159157260%26m%3D187229354626%26pt%3DCreditCardRUB&charset=utf-8&browser-info=pv%3A1%3Avf%3A3kqlg6e9sjiwxr6f2njdv%3Afp%3A242%3Afu%3A0%3Aen%3Autf-8%3Ala%3Aen-US%3Av%3A960%3Acn%3A1%3Adp%3A0%3Als%3A1145526276304%3Ahid%3A722727997%3Az%3A180%3Ai%3A20230209133311%3Aet%3A1675938791%3Ac%3A1%3Arn%3A479198391%3Arqn%3A18%3Au%3A164936137374454310%3Aw%3A2581x670%3As%3A5120x1440x24%3Ask%3A1%3Ads%3A0%2C0%2C47%2C1%2C60%2C59%2C2%2C196%2C2%2C%2C%2C%2C306%3Aco%3A0%3Acpf%3A1%3Antf%3A1%3Ans%3A1675938790949%3Aadb%3A1%3Arqnl%3A1%3Ast%3A1675938791%3At%3A&t=gdpr(14)clc(0-0-0)rqnt(1)aw(1)ti(2)

//Remote Address: 93.158.134.119:443
//Payload:
//wmode:7
//page-url:https://wl.walletone.com/checkout/refill/CreditCard/328924577/NewCard
//page-ref:https://wl.walletone.com/checkout/checkout/Login?i=350159157260&m=187229354626&pt=CreditCardRUB
//charset:utf-8
//browser-info:pv:1:vf:3kqlg6e9sjiwxr6f2njdv:fp:242:fu:0:en:utf-8:la:en-US:v:960:cn:1:dp:0:ls:1145526276304:hid:722727997:z:180:i:20230209133311:et:1675938791:c:1:rn:479198391:rqn:18:u:164936137374454310:w:2581x670:s:5120x1440x24:sk:1:ds:0,0,47,1,60,59,2,196,2,,,,306:co:0:cpf:1:ntf:1:ns:1675938790949:adb:1:rqnl:1:st:1675938791:t:
//t:gdpr(14)clc(0-0-0)rqnt(1)aw(1)ti(2)

//Response:
//{
//    "settings": {
//        "auto_goals": 0,
//        "button_goals": 0,
//        "c_recp": "1.00000",
//        "form_goals": 0,
//        "pcs": "1",
//        "webvisor": {
//            "arch_type": "html",
//            "date": "2023-02-02 00:08:54",
//            "forms": 1,
//            "recp": "1.00000",
//            "urls": "regexp:.*\nwl.walletone.com/.*"
//        },
//        "sbp": {
//            "a": "IEEfoD9hA3HLRI++t5bZTav0nPIlqqxG0ziPcLYYRWnfzajnBbxp02fW0StBXxYq",
//            "b": "3MVOPEbX4X9TJuU5+aeBfyMq4OEr6h/98yXpJI4EnSAzGEKMFjWj16NMqlM6BMna"
//        },
//        "eu": 0,
//        "hittoken": "1675938791_94863c5867f5c56edee45a14bda41f6a3f33d36b1f9b49bb700178cbfe6fbff9"
//    },
//    "userData": {}
//}
