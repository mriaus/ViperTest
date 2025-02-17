//
//  Note+CoreDataProperties.swift
//  ViperTest
//
//  Created by Marcos on 17/2/25.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension Note : Identifiable {

}
