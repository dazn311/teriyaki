//
//  CacheAsyncImage.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View{
    private let id: String
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        id: String,
        url: URL,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ){
        self.id = id
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View{
        if let cached = ImageCache[url]{
//            let _ = print("cached: \(url.absoluteString)")
            content(.success(cached))
        }else{
//            let _ = print("request: \(url.absoluteString)")
            
            if let im22 = getLocalImg(id: id) {
                content(.success(im22))
            }else {
                AsyncImage(
                    url: url,
                    scale: scale,
                    transaction: transaction
                ){phase in
                    cacheAndRender(phase: phase)
                }
            }
            
            
        }
    }
    func cacheAndRender(phase: AsyncImagePhase) -> some View{
        if case .success (let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

fileprivate class ImageCache{
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image?{
        get{
            ImageCache.cache[url]
        }
        set{
            ImageCache.cache[url] = newValue
        }
    }
}

func getLocalImg(id: String) -> Image? {
    if let myImg = UIImage(named: id) {
//        let _ = print("getLocalImg: \(id)")
        return Image(uiImage: myImg)
    }else {
        return nil
    }
//    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//    let url = NSURL(fileURLWithPath: path)
//    if let pathComponent = url.appendingPathComponent(id) {
//        let filePath = pathComponent.path
//        let fileManager = FileManager.default
//        if fileManager.fileExists(atPath: filePath) {
//            print("FILE AVAILABLE")
//            return Image(id)
//        } else {
//            print("FILE NOT AVAILABLE")
//            return nil
//        }
//    } else {
//        print("FILE PATH NOT AVAILABLE")
//        return nil
//    }
}
