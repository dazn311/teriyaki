import UIKit
import SwiftUI

struct ItemPrd: View {
    @Environment(\.managedObjectContext) private var viewContext
    var product: ProductFromCatalog? = nil
    var isShowPrice: Bool = false
    
    var body: some View {
        if let prd = product {
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 1) {
        //            Text("id: \(id)")
                    CacheAsyncImage(id: prd.id, url: URL(string: prd.thumb)!) { AsyncImagePhase in
                        switch AsyncImagePhase {
                                case .success(let image):
                                    image
                                    .resizable()
                                    .scaledToFit()
                                case .empty:
                                    Image("\(prd.id)")
                                    .resizable()
                                    .clipped()
                                case .failure(_):
                                    Image("\(prd.id)")
                                    .resizable()
                                    .clipped()
                                @unknown default:
                                    Image("\(prd.id)")
                                    .resizable()
                                    .clipped()
                                }
                        
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(prd.name)")
                            .foregroundColor(Color(red: 205 / 255, green: 91 / 255, blue: 15 / 255)) // If you have this
                            .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                            .padding(.horizontal,0)
                        Text(transformDescribe(describe: prd.description))
                            .foregroundColor(Color.gray)
                            .padding(.horizontal,0)
                            .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .topLeading)
                            .lineLimit(3)
                        
                        
                    }
                    .frame(minHeight: 128, maxHeight: 128, alignment: .leading)

    //                    BtnPay(price: price)
                    BtnPay(prd: prd)
                        .environment(\.managedObjectContext, viewContext)


                }
                Spacer()
            }
            .onAppear {
                if isShowPrice {
                    Tool.hideTabBar()
                }
            }
            .onDisappear {
                withAnimation {
                    if isShowPrice {
                     Tool.showTabBar()
                    }
                }
                
            }
        }
    }
}

struct ItemPrd_Previews: PreviewProvider {
    static let name = "Гункан тигровая креветка спайси"
    static let pic = "https://teriyaki.su/image/cache/catalog/Japan/Gunkan/gunkan-krevetka-300x200.png"
    static let describe = "рёбра говяжьи, лапша стеклянная, бульон говяжий.Подается с рисом400г.."
    static let price = "210P"
    
    static var previews: some View {
        HStack {
            ItemPrd(product: ProductFromCatalog(id: "1", thumb: "https://teriyaki.su/image/cache/catalog/Japan/Gunkan/gunkan-krevetka-300x200.png", name: "Гункан тигровая креветка спайси", description: describe, price: price, jan: "", sortOrder: "1", viewed: "", categoryID: "70", rating: 3, href: ""), isShowPrice: true)
        }
        .frame(width: 360, height: 500)
        .padding(.horizontal,4)
        .border(Color.green)
        
    }
}

let imageCache = NSCache<NSString, AnyObject>()


func transformDescribe(describe: String)-> String {
    //&nbsp;
    if describe.contains("&nbsp;") {
        return describe.replacingOccurrences(of: "&nbsp;", with: " ")
    }
    return describe
}

func transformPrice(price: String)-> String {
    //&nbsp;
    if price.contains(".") {
        let pr = price.split(separator: ".")
        return "\(pr[0])p"//price.replacingOccurrences(of: "&nbsp;", with: " ")
    }
    return "\(price)p"
}


//extension UIImageView {
//    func loadImageUsingCache(withUrl urlString : String) {
//        let url = URL(string: urlString)
//        self.image = nil
//
//        // check cached image
//        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
//            self.image = cachedImage
//            return
//        }
//
//        // if not, download image from url
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//
//            DispatchQueue.main.async {
//                if let image = UIImage(data: data!) {
//                    imageCache.setObject(image, forKey: urlString as NSString)
//                    self.image = image
//                }
//            }
//
//        }).resume()
//    }
//}

//AsyncImage(url: URL(string: pic)) { image in
//        image
//            .resizable()
//            .scaledToFill()
//            .clipped()
//    } placeholder: {
//        ZStack {
//            ProgressImage()
//        }
//    }
