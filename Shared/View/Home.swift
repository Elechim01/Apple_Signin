//
//  Home.swift
//  Home
//
//  Created by Michele Manniello on 10/09/21.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_status") var login_Status = false
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Logged In Successfuly Using Apple Login")
                Button {
//                   Logging Out User...
                   DispatchQueue.global(qos: .background).async {
                       try?  Auth.auth().signOut()
                    }
//                    setting Back View To Login...
                    withAnimation(.easeInOut){
                        login_Status = false
                    }
                } label: {
                    Text("Log Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,12)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
