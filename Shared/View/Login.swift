//
//  Login.swift
//  Login
//
//  Created by Michele Manniello on 10/09/21.
//

import SwiftUI
import AuthenticationServices
struct Login: View {
    @StateObject var loginData = LoginViewModel()
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.35 ))
                .ignoresSafeArea()
            VStack(spacing: 25){
                Text("Unsplash")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Spacer()
                VStack(alignment: .leading, spacing: 30) {
                    Text("Largest\nImages Library")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("the internet's source of freely.usable")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,30)
                Spacer()
//                Login Button
                SignInWithAppleButton { request in
//                    request paramertes from apple login...
                    loginData.nonce = randomNonceString()
                    request.requestedScopes = [.email,.fullName]
                    request.nonce = sha256(loginData.nonce)
                    
                } onCompletion: { result in
//                    getting error or success...
                    switch result{
                    case .success(let user):
                        print("success")
//                        do Login With Firebase..
                        guard let credental = user.credential as? ASAuthorizationAppleIDCredential else{
                            print("error with firebase")
                            return
                        }
                        loginData.authenticate(credential: credental)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .clipShape(Capsule())
                .padding(.horizontal,40)
                .offset(y: -70)

            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
