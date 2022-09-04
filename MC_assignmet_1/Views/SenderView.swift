//
//  SenderView.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/3/22.
//

import SwiftUI

struct SenderView: View {
    @StateObject var appState : AppState
    
    var body: some View {
        VStack{
            Text("Sender View")
            Button(action: {
                appState.route=routesType.camera
            }, label:{
                Text("go to camera view")
            })
        }
        
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView(appState: AppState())
    }
}
