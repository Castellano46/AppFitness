//
//  Exercise.swift
//  AppFitness
//
//  Created by Pedro on 9/10/23.
//

import Foundation
import CoreData

public class Exercise: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var duration: Float
    @NSManaged public var weight: Float
}
