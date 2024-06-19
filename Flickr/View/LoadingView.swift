//
//  LoadingView.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(3)
        }
    }
}

#Preview {
    LoadingView()
}
