//
//  SettingPageView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct SettingPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var catsVM : CategoriesListViewModel
    
    @FetchRequest var versionEntity: FetchedResults<VersionDataEntity>
    @FetchRequest var catLevelEntity: FetchedResults<CatLevelEntity>
    
    @State var isShowInfo: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 2) {
                Text("Версия программы")
                
                List(["Версии"], id: \.self) { cat in
                    Section(cat) {
                        ForEach(versionEntity, id: \.self) { ver2 in
                            HStack {
                                Text("кухни v.\(ver2.category)")
                            }
                        }
                        .onDelete { IndexSet in
                            print("del: \(IndexSet)")
                            self.deleteVersion(offesets: IndexSet)
                            self.deleteAllCatCore()
                            self.isShowInfo = true
                        }
                    }
                }
                .frame(height: 100)
                List(["Кухни"], id: \.self) { cat in
                    Section(cat) {
                        ForEach(catLevelEntity, id: \.self) { catLevel in
                            HStack {
                                Text("\(catLevel.name)")
                            }
                        }
                        .onDelete { IndexSet in
                            print("del: \(IndexSet)")
                            self.deleteCatCore(offesets: IndexSet)
                            self.isShowInfo = true
                        }
                    }
                }
                .frame(height: 300)
                Spacer()
            }
            if isShowInfo {
                VStack {
                    Spacer()
                    Text("Чтобы изменения вступили в действие")
                    Text("нужно перезагрузить приложение")
                }
                .foregroundColor(Color.red)
                .padding()
            }
        }
    }
    
    init() {
        _versionEntity = FetchRequest<VersionDataEntity>(sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: nil)
        _catLevelEntity = FetchRequest<CatLevelEntity>(sortDescriptors: [], predicate: nil)
    }
    
    private func deleteVersion(offesets: IndexSet){
        for index in offesets {
          let prd = versionEntity[index]
          viewContext.delete(prd)
        }
        try? viewContext.save()
    }
    private func deleteAllVersion(){
        for ver2 in versionEntity {
          viewContext.delete(ver2)
        }
        try? viewContext.save()
    }
    
    private func deleteCatCore(offesets: IndexSet){
        for index in offesets {
          let prd = catLevelEntity[index]
          viewContext.delete(prd)
        }
        print("catLevelEntity count:\(catLevelEntity.count) ")
        if catLevelEntity.count == 1 {
            //if delete last then del ver;
            deleteAllVersion()
            
        }
        try? viewContext.save()
    }
    
    private func deleteAllCatCore(){
        for cat2 in catLevelEntity {
            viewContext.delete(cat2)
        }
        try? viewContext.save()
    }
}
