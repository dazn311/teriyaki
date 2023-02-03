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
    var body: some View {
        VStack {
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
        }
    }
    
    init() {
        _versionEntity = FetchRequest<VersionDataEntity>(sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: nil)
    }
    
    func deleteTodo(prds: [VersionDataEntity], offesets: IndexSet){
        for index in offesets {
          let prd = prds[index]
            viewContext.delete(prd)
        }
        try? viewContext.save()
    }
}
