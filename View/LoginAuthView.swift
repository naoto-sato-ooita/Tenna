//
//  LoginAuthView.swift
//  TestAuth
//
//  Created by t&a on 2023/04/02.
//

import SwiftUI

struct LoginAuthView: View {
    
    // MARK: - Inputプロパティ
    @State var email:    String = ""
    @State var password: String = ""
    
    // MARK: - Navigationプロパティ
    @State var isActive: Bool = false
    
    var body: some View {
        VStack{
            
            // MARK: - エラーメッセージ
            ErrorMessageView()
            
            
            NavigationStack{
                VStack{
                    Spacer()
                    //logp image
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 80))
                        .frame(width: 150,height: 150)
                        .padding()
                    
                    // MARK: - InputBox
                    //text field viewmodelに格納
                    VStack(spacing: 12 ){
                        TextField("Enter your Email", text: $email) //viewModelのemailに保存
                            .font(.subheadline)
                            .padding(12)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                            .padding(.horizontal,24)
                        
                        
                        SecureInputView(password: $password)
                    }
                    
                    // MARK: - パスワードリセット画面遷移ボタン
                    HStack{
                        Spacer()
                        NavigationLink{
                            PasswordResetView()
                        }
                    label: { Text("Forgot Password")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing,20)
                        }
                        .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    
                    // MARK: - ログインボタン
                    EmailAuthButtonView(isActive: $isActive, name: nil, email: email, password: password)
                    
                    
                    // MARK: - 透明のNavigationLink
                    NavigationLink(isActive: $isActive, destination:{
                        ContentView() },
                                   label: {
                        EmptyView()
                    })
                    
                    //Apple login
                    HStack{
                        Rectangle()
                            .frame(width:((UIScreen.main.bounds.width) / 2 ) - 40, height:0.5 )
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Rectangle()
                            .frame(width:((UIScreen.main.bounds.width) / 2 ) - 40, height:0.5 )
                    }
                    .foregroundColor(.gray)
                    
                    .padding()
                    Spacer()
                    
                    // MARK: - 未登録遷移ボタン
                    HStack{
                        Spacer()
                        NavigationLink{
                            AccountResistView()
                        }
                    label: {
                        HStack(spacing: 3){
                            Text("Don't have aaccount?")
                            
                            Text("Sign up")
                                .fontWeight(.semibold)
                        }
                        .font(.footnote)
                    }
                    .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct LoginAuthView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAuthView()
    }
}
