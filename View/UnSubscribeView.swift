//
//  UnSubscribeView.swift
//
//
//
//

import SwiftUI

struct UnSubscribeView: View {
    
    // MARK: - ViewModels
    @ObservedObject var authVM = AuthViewModel.shared
    
    // MARK: - Navigationプロパティ
    @State var isActive:Bool = false
    
    @State  var password:String = ""
    
    var body: some View {
        VStack{
            
            // MARK: - 透明のNavigationLink
            NavigationLink(isActive: $isActive, destination:{
                LoginAuthView()}, 
            label: {
                EmptyView()
            })
            
            // MARK: - Email
            SecureInputView(password: $password)
            
            Button {
                if !password.isEmpty{
                    authVM.credentialEmailWithdrawal(password:password) { result in
                        if result {
                            isActive = true
                        }
                    }
                }
                
            } label: {
                Text("Unsubscribe")
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width:360, height:44)
            .background(Color(.systemRed))
            .cornerRadius(10)
            
            Divider().padding()
            
        }
    }
}

struct UnSubscribeView_Previews: PreviewProvider {
    static var previews: some View {
        UnSubscribeView()
    }
}
