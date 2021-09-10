//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 10/09/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var login_Status = false
    var body: some View {
        ZStack{
            if login_Status{
                Home()
            }else{
                Login()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
