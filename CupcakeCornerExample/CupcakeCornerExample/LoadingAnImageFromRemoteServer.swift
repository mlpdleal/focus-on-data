//
//  LoadingAnImageFromRemoteServer.swift
//  CupcakeCornerExample
//
//  Created by Manoel Leal on 13/06/22.
//

import SwiftUI

struct LoadingAnImageFromRemoteServer: View {
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
    
}

struct LoadingAnImageFromRemoteServer_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnImageFromRemoteServer()
    }
}
