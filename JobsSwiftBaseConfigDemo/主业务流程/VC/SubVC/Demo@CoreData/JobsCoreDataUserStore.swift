//
//  JobsCoreDataUserStore.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import Foundation
import CoreData

struct JobsCoreDataUser {

    let objectID: NSManagedObjectID
    let name: String
    let age: Int32
}

enum JobsCoreDataUserError: Error {

    case missingModel
    case emptyName
    case invalidAge
    case invalidRecord

    var messageKey: String {
        switch self {
        /// 模型缺失时提示检查打包资源。
        case .missingModel:
            return "不能读取数据库模型。"
        /// 空姓名引导补全输入。
        case .emptyName:
            return "姓名不能为空。"
        /// 年龄错误说明可接受的范围和格式。
        case .invalidAge:
            return "年龄须为 0～150 的整数。"
        /// 无效存储记录单独提示，避免当成空库。
        case .invalidRecord:
            return "数据库记录缺少必要字段。"
        }
    }
}

/// Core Data 适配层承接系统 API；外层只消费值快照，不跨 context 传递托管对象。
final class JobsCoreDataUserStore {

    private let container: NSPersistentContainer
    let storeURL: URL

    init(modelURL: URL? = Bundle.main.url(forResource: "JobsSwiftBaseConfigDemo",
                                         withExtension: "momd"),
         storeURL: URL? = nil) throws {
        guard let modelURL,
              let model = NSManagedObjectModel(contentsOf: modelURL),
              model.entitiesByName["User"] != nil else {
            throw JobsCoreDataUserError.missingModel
        }
        let resolvedURL: URL
        if let storeURL {
            resolvedURL = storeURL
        } else {
            let support = try FileManager.default.url(for: .applicationSupportDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: true)
            resolvedURL = support
                .appendingPathComponent("JobsSwiftBaseConfigDemo", isDirectory: true)
                .appendingPathComponent("Users.sqlite")
        }
        try FileManager.default.createDirectory(at: resolvedURL.deletingLastPathComponent(),
                                                withIntermediateDirectories: true)
        self.storeURL = resolvedURL
        container = NSPersistentContainer(name: "JobsSwiftBaseConfigDemo",
                                           managedObjectModel: model)
        let description = NSPersistentStoreDescription(url: resolvedURL)
        description.type = NSSQLiteStoreType
        description.shouldAddStoreAsynchronously = false
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
        var loadError: Error?
        container.loadPersistentStores { _, error in
            loadError = error
        }
        if let loadError {
            throw loadError
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
    }

    func fetchUsers() throws -> [JobsCoreDataUser] {
        try container.viewContext.performAndWait {
            let request = NSFetchRequest<NSManagedObject>(entityName: "User")
            // 刷新已注册对象，使另一 Scene 的独立容器保存后，本页重载能读取最新字段。
            request.shouldRefreshRefetchedObjects = true
            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                                       NSSortDescriptor(key: "age", ascending: true)]
            return try container.viewContext.fetch(request).map { object in
                guard let name = object.value(forKey: "name") as? String,
                      let age = object.value(forKey: "age") as? NSNumber else {
                    throw JobsCoreDataUserError.invalidRecord
                }
                return JobsCoreDataUser(objectID: object.objectID,
                                        name: name,
                                        age: age.int32Value)
            }
        }
    }

    static func validatedInput(name: String,
                               ageText: String) throws -> (name: String, age: Int32) {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else {
            throw JobsCoreDataUserError.emptyName
        }
        guard let age = Int32(ageText.trimmingCharacters(in: .whitespacesAndNewlines)),
              (0...150).contains(age) else {
            throw JobsCoreDataUserError.invalidAge
        }
        return (trimmedName, age)
    }

    func saveUser(objectID: NSManagedObjectID? = nil,
                  name: String,
                  ageText: String) throws {
        let input = try Self.validatedInput(name: name,
                                            ageText: ageText)
        try mutate { context in
            let object: NSManagedObject
            if let objectID {
                object = try context.existingObject(with: objectID)
            } else {
                object = NSEntityDescription.insertNewObject(forEntityName: "User",
                                                              into: context)
            }
            object.setValue(input.name, forKey: "name")
            object.setValue(input.age, forKey: "age")
        }
    }

    func deleteUser(objectID: NSManagedObjectID) throws {
        try mutate { context in
            context.delete(try context.existingObject(with: objectID))
        }
    }

    func deleteAllUsers() throws {
        try mutate { context in
            let request = NSFetchRequest<NSManagedObject>(entityName: "User")
            for object in try context.fetch(request) {
                context.delete(object)
            }
        }
    }

    private func mutate(_ action: (NSManagedObjectContext) throws -> Void) throws {
        let context = container.viewContext
        try context.performAndWait {
            do {
                try action(context)
                if context.hasChanges {
                    try context.save()
                }
            } catch {
                // 失败后撤销本次内存变更，避免后续操作意外提交失败草稿。
                context.rollback()
                throw error
            }
        }
    }
}
