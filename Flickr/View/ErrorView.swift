//
//  ErrorView.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        Text(errorMessage)
    }
}

#Preview {
    ErrorView(errorMessage: "Error")
}
