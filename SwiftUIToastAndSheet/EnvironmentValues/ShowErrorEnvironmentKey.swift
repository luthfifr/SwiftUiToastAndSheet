//
//  ShowErrorEnvironmentKey.swift
//  SwiftUIToastAndSheet
//
//  Created by Luthfi Fathur Rahman on 03/12/24.
//

import Foundation
import SwiftUI

struct ShowErrorAction {
    typealias Action = (Error, String) -> Void
    
    let action: Action
    
    func callAsFunction(error: Error, guidance: String) {
        action(error, guidance)
    }
}

struct ShowErrorEnvironmentKey: EnvironmentKey {
    static var defaultValue: ShowErrorAction = ShowErrorAction { _, _ in }
    
}

extension EnvironmentValues {
    var showError: (ShowErrorAction) {
        get {
            self[ShowErrorEnvironmentKey.self]
        }
        set {
            self[ShowErrorEnvironmentKey.self] = newValue
        }
    }
}
