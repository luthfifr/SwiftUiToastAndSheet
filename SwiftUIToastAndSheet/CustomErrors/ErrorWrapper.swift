//
//  ErrorWrapper.swift
//  SwiftUIToastAndSheet
//
//  Created by Luthfi Fathur Rahman on 03/12/24.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
}
