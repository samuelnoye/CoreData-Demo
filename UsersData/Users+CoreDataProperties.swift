//
//  Users+CoreDataProperties.swift
//  CoreData-Demo
//
//  Created by Samuel Noye on 31/03/2022.
//
//

import Foundation
import CoreData


extension Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Info> {
        return NSFetchRequest<Info>(entityName: "UsersInfo")
    }
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double?
    @NSManaged public var createdAt: Date?

}

extension Info : Identifiable {

}
