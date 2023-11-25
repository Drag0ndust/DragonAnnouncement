//
//  UserDefaults+Codable.swift
//
//
//  Created by Drag0ndust on 25.11.23.
//

import Foundation

/// This extension was part of a blog post
/// Source: https://agrawalsuneet.github.io/blogs/custom-object-in-userdefaults-swift/
extension UserDefaults {
    func storeCodable(_ object: some Codable, key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            set(data, forKey: key)
        } catch {
            print("Error encoding: \(error)")
        }
    }

    func retrieveCodable<T: Codable>(for key: String, type _: T.Type) -> T? {
        do {
            guard let data = data(forKey: key) else {
                return nil
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error decoding: \(error)")
            return nil
        }
    }
}
