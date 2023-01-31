//
//  ItemPrd.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//
import UIKit
import SwiftUI

struct ItemPrd: View {
    var name = "test"
    var pic = ""
    var describe = ""
    var price = "0"
    
    var body: some View {
        VStack(spacing: 1) {
            CacheAsyncImage(url: URL(string: pic)!) { AsyncImagePhase in
                AsyncImage(url: URL(string: pic)) { image in
                        image
                            .resizable()
                            .scaledToFill()
//                            .frame(height: 200)
                            .clipped()
                    } placeholder: {
                        ZStack {
//                            Color.brown
                            ProgressImage()
                        }
                        
                    }
//                    .frame(height: 200)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("\(name)")
                    .foregroundColor(Color(red: 205 / 255, green: 91 / 255, blue: 15 / 255)) // If you have this
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                    .padding(.horizontal,0)
//                    .background(Color.green)
                Text(transformDescribe(describe: describe))
                    .foregroundColor(Color.gray)
                    .padding(.horizontal,0)
                    .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .topLeading)
                    .lineLimit(3)
//                    .background(Color.red)
                
                
            }
            .frame(minHeight: 128, maxHeight: 128, alignment: .leading)
//            Spacer()
            
            HStack {
                Button {
   //                                         parentId = catObj.category_id
   //                 print(catObj.categoryID)
                } label: {
                    Text(price)
                        .badge(3)
                        .foregroundColor(Color(red: 255 / 255, green: 225 / 255, blue: 189 / 255)) // If you have this
   //                     .foregroundColor(catObj.parentID == "0" ? Color(.red): Color(.black))
                        .frame(maxHeight: 30)
                        .padding(.horizontal,16)
                        .padding(.vertical, 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 1))

                }
//                .background(Color(red: 255 / 255, green: 225 / 255, blue: 189 / 255)) // If you have this
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
            
            
//            .overlay {
//
//                Text("3")
//                    .padding(-10)
//            }

            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.indigo)
    
        
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

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }

        }).resume()
    }
}

func transformDescribe(describe: String)-> String {
    //&nbsp;
    if describe.contains("&nbsp;") {
        return describe.replacingOccurrences(of: "&nbsp;", with: " ")
    }
    return describe
}
