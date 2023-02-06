//
//  SettingPageView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct SettingPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @EnvironmentObject var catsVM : CategoriesListViewModel
    
    @FetchRequest var versionEntity: FetchedResults<VersionDataEntity>
    @FetchRequest var catLevelEntity: FetchedResults<CatLevelEntity>
    
    @State var isShowInfo: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 2) {
                Text("Настройки")
                
                List([" "], id: \.self) { cat in
                    Section("Версия каталога") {
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
                    Section("список доступной Кухни") {
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
                Spacer()
            }
            if isShowInfo {
                VStack {
                    Spacer()
                    Text("Чтобы изменения вступили в силу")
                    Text("- перезагрузите приложение")
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
    

}

struct SettingPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPageView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension SettingPageView {
    private func deleteVersion(offesets: IndexSet){
        withAnimation {
            VersionDataEntity.delete(at: offesets, for: Array(versionEntity))
            PersistenceController.shared.save()
        }
    }
    
    private func deleteAllVersion(){
        withAnimation {
            VersionDataEntity.deleteAll(for: Array(versionEntity))
            PersistenceController.shared.save()
        }
    }
    
    private func deleteCatCore(offesets: IndexSet){
        if catLevelEntity.count == 1 {
            //if delete last then del ver;
            deleteAllVersion()
        }
        withAnimation {
            CatLevelEntity.delete(at: offesets,for: Array(catLevelEntity))
            PersistenceController.shared.save()
        }
        
    }
    
    private func deleteAllCatCore(){
        withAnimation {
            CatLevelEntity.deleteAll(for: Array(catLevelEntity))
            PersistenceController.shared.save()
        }
    }
}
