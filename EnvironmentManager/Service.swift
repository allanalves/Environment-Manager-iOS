//
//  Service.swift
//  EnvironmentManager
//
//  Created by Allan Alves on 27/05/17.
//  Copyright © 2017 Allan Alves. All rights reserved.
//

import Foundation

class Service {

    enum Environment: String {
        case production
        case homologation
        case development
        case custom
    }

    static func enviromentUrl(_ environment: Environment) -> URL? {
        if let path = Bundle.main.url(forResource: "service", withExtension: "plist"),
            let data = try? Data(contentsOf: path) {
            if let result = try! PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String:String] {
                return URL(string: result[environment.rawValue]!)
            }
        }
        return nil
    }
}
