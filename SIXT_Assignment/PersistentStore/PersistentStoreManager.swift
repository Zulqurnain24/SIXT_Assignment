//
//  PersistentStore.swift
//  SIXT_Assignment
//
//  Created by Mohammad Zulqarnain on 19/11/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

protocol PersistentStoreManagerProtocol {
    func setObject<T: Codable>(key: String, value: T)
    func getObject<T: Codable>(_ key: String, _ type: T.Type) -> T?
}

/* PersistentStore
 It deals with the persistence store
 */
class PersistentStoreManager: PersistentStoreManagerProtocol {
    
    static let shared = PersistentStoreManager()
    
    func setObject<T: Codable>(key: String, value: T) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    
    func getObject<T: Codable>(_ key: String, _ type: T.Type) -> T? {
        if let data = UserDefaults.standard.value(forKey: key) as! Data? {
            guard let object = try? PropertyListDecoder().decode(type, from: data) else { return nil }
            return object
        }
        return nil
    }
    
    func clearData(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}


