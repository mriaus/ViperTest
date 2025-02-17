//
//  ViperTestApp.swift
//  ViperTest
//
//  Created by Marcos on 17/2/25.
//

import SwiftUI
import CoreData

@main
struct ViperTestApp: App {
    let persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Notes")
            container.loadPersistentStores { _, error in
                if let error = error {
                    fatalError("Error al cargar Core Data: \(error)")
                }
            }
            return container
        }()
    let router = NotesRouter()
    
    var body: some Scene {
        WindowGroup {
            router.listView(context: persistentContainer.viewContext)
        }
    }
}
