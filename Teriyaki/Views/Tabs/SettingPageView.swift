//
//  SettingPageView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct SettingPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var versionEntity: FetchedResults<VersionDataEntity>
    @FetchRequest var catLevelEntity: FetchedResults<CatLevelEntity>
    var body: some View {
        VStack(spacing: 10) {
            Text("Версия программы")
            
            List(["Версии"], id: \.self) { cat in
                Section(cat) {
                    ForEach(versionEntity, id: \.self) { ver2 in
                        HStack {
                            Text("версия категории: \(ver2.category)")
                        }
                    }
                    .onDelete { IndexSet in
                        print("del: \(IndexSet)")
                        self.deleteTodo(prds: Array(versionEntity), offesets: IndexSet)
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
                        self.deleteTodo(prds: Array(versionEntity), offesets: IndexSet)
                    }
                }
            }
            Spacer()
        }
    }
    
    init() {
        _versionEntity = FetchRequest<VersionDataEntity>(sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: nil)
        _catLevelEntity = FetchRequest<CatLevelEntity>(sortDescriptors: [], predicate: nil)
    }
    
    func deleteTodo(prds: [VersionDataEntity], offesets: IndexSet){
        for index in offesets {
          let prd = prds[index]
            viewContext.delete(prd)
        }
        try? viewContext.save()
    }
}
