//
//  DefaultTokenPersistence.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import CoreData

class DefaultTokenPersistence: SessionWriter {
    private let dataManager = DataManager.shared.persistentContainer
    private let entityName = "AccessToken"

    func persistToken(_ token: String?) throws {
        let context = self.dataManager.viewContext
        guard let userEntity = NSEntityDescription.entity(forEntityName: entityName,
                                                          in: context) else {
            throw SessionWriterError.errorEntityNotFound
        }

        let user = NSManagedObject(entity: userEntity, insertInto: context)

        user.setValue(token, forKey: "token")

        do {
            try context.save()
        } catch {
            throw SessionWriterError.errorSavingToken
        }
    }

    func loadToken() throws -> String? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let context = self.dataManager.viewContext

        guard let result = try context.fetch(fetchRequest) as? [NSManagedObject] else {
            throw SessionWriterError.errorObtainingTokenSaved
        }

        guard let accessToken = result.first as? AccessToken else {
            throw SessionWriterError.errorConvertingToString
        }

        return accessToken.token
    }

    func deleteTable() {
        let context = self.dataManager.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(batchDeleteRequest)
        } catch {
            print("-->> Error delete \(entityName)")
        }
    }
}
