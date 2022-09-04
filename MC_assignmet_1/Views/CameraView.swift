//
//  CameraView.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/3/22.
//

import SwiftUI

struct CameraView: View {
    @StateObject var appState : AppState
    var body: some View {
        VStack{
            Text("camera View")
            Button(action: {
                appState.route = routesType.sender
            }, label: {
                Text("go to sender view")
            })
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(appState: AppState())
    }
}
