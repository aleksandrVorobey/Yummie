//
//  UserDefaults+Extension.swift
//  Yummie
//
//  Created by admin on 07.06.2022.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
            case hasOnboarded
        }
        
        var hasOnboarded: Bool {
            get {
                bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            }
            
            set {
                setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            }
        }
}
