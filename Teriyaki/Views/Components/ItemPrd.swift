//
//  ItemPrd.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//
import UIKit
import SwiftUI

struct ItemPrd: View {
    var id = "1"
    var name = "test"
    var pic = ""
    var describe = ""
    var price = "0"
    
    var body: some View {
        VStack(spacing: 1) {
//            Text("id: \(id)")
            CacheAsyncImage(id: id, url: URL(string: pic)!) { AsyncImagePhase in
                switch AsyncImagePhase {
                        case .success(let image):
                            image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                        case .empty:
                            Image(systemName: "sleep")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                        case .failure(_):
                            Image(systemName: "power.dotted")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                        @unknown default:
                            Image("\(id)")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                        }
                
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("\(name)")
                    .foregroundColor(Color(red: 205 / 255, green: 91 / 255, blue: 15 / 255)) // If you have this
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                    .padding(.horizontal,0)
                Text(transformDescribe(describe: describe))
                    .foregroundColor(Color.gray)
                    .padding(.horizontal,0)
                    .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .topLeading)
                    .lineLimit(3)
                
                
            }
            .frame(minHeight: 128, maxHeight: 128, alignment: .leading)
            
            HStack {
                Button {
   //                                         parentId = catObj.category_id
   //                 print(catObj.categoryID)
                } label: {
                    Text(transformPrice(price: price))
                        .badge(3)
                        .foregroundColor(Color(red: 255 / 255, green: 225 / 255, blue: 189 / 255)) // If you have this
                        .frame(maxHeight: 30)
                        .padding(.horizontal,16)
                        .padding(.vertical, 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 1))

                }
                .cornerRadius(4)         // You also need th
                .overlay(alignment: .topTrailing) {
                    Text("3")
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(Color.red)
                                .aspectRatio(1, contentMode: .fill)
                        )
                        .offset(x: 5, y: -10)
                }
                
                Spacer()
            }
            .frame(minHeight: 50, maxHeight: 50, alignment: .leading)
            .padding(.horizontal,10)
            .padding(.bottom,4)
            
        }
//        .navigationBarTitle(name)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .navigationTitle("helllo")
//        .edgesIgnoringSafeArea(.all)
//        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height - 100)
//        .background(Color.green)
        
    }
}

struct ItemPrd_Previews: PreviewProvider {
    static let name = "Гункан тигровая креветка спайси"
    static let pic = "https://teriyaki.su/image/cache/catalog/Japan/Gunkan/gunkan-krevetka-300x200.png"
    static let describe = "рёбра говяжьи, лапша стеклянная, бульон говяжий.Подается с рисом400г.."
    static let price = "210P"
    
    static var previews: some View {
        HStack {
            ItemPrd(name: name, pic: pic, describe: describe, price: price)
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
