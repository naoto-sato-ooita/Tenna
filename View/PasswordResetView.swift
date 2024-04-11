//
//  PasswordResetView.swift
//  TestAuth
//
//  Created by t&a on 2023/04/03.
//

import SwiftUI
import FirebaseAuth

struct PasswordResetView: View {
    
    // MARK: - ViewModels
    @ObservedObject var authVM = AuthViewModel.shared
    private let validationVM = ValidationViewModel()
    
    // MARK: - Inputプロパティ
    @State var email:    String = ""
    
    // MARK: - Inputプロパティ
    @State var wasSent:  Bool = false
        
    var body: some View {
        VStack{
            
            Text("Please enter your registered email address. \nA reset email will be sent to the your email address & reset your settings from the URL provided.").padding()
            
            if wasSent{
                Text("A reset email has been sent to your email address.")
            }
            
            // MARK: - エラーメッセージ
            ErrorMessageView()
            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                if validationVM.validateEmail(email: email) {
                    authVM.resetPassWord(email: email) { result in
                        wasSent = result
                    }
                }
            }, label: {
                Text("Send")
            })
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width:360, height:44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
            
        }
        .onAppear { authVM.resetErrorMsg() }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

