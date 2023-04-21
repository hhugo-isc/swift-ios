//
//  EntityModelMapProtocol.swift
//  MVC-TodoApp
//
//  Created by administrador on 17/04/23.
//

import Foundation
import CoreData

protocol EntityModelMapProtocol{
    associatedtype EntityType: NSManagedObject
    
    func mapToEntityInContext(_ context: NSManagedObjectContext) -> EntityType
    
    static func mapFromEntity(_ entity: EntityType) -> Self
    
}
