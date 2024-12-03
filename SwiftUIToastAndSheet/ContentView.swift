//
//  ContentView.swift
//  SwiftUIToastAndSheet
//
//  Created by Luthfi Fathur Rahman on 03/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.showError) private var showError
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                showError(error: SampleError.operationFailed, guidance: "Operation has failed. Please try again later.")
            }
        }
        .padding()
    }
}

// created to enable Preview works
struct ContentViewContainer: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some View {
        ContentView()
            .environment(\.showError, ShowErrorAction(action: showError))
            .sheet(item: $errorWrapper) { errorWrapper in
                Text(errorWrapper.guidance
                )
            }
    }
    
    private func showError(error: Error, guidance: String) {
        errorWrapper = ErrorWrapper(error: error, guidance: guidance)
    }
}

#Preview {
    ContentViewContainer()
}
