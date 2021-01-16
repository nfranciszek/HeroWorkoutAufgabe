//
//  LoginView.swift
//  HeroWorkoutAufgabeApp
//
//  Created by Nathanael Franciszek on 1/16/21.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var didSplashScreenFinishLoading: Bool = false
    
    var darkColorTrans: Color = Color.darkColorTrans
    var lightGray: Color = Color.lightGray
    var redColor: Color = Color.redColor
    var companyLogo = "TransparentZONEHW"
    var backgroundPhoto = "workoutGirl"
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    @State var showPassword = false
    
    @State var redPasswordAlert = false
    @State var showPasswordError = false
    @State var isValidPassword = false
    
    @State var redEmailAlert = false
    @State var showEmailError = false
    @State var isValidEmail = false
    
    
    @State var showLoginSuccess = false
    
    
    
    
    
    @State private var passwordErrorText: String = "Dein Passwort muss mindestens 12 Zeichen lang sein und muss einen Großbuchstaben, eine Zahl, und ein Sonderzeichen enthalten"
    
    @State private var emailErrorText: String = "Bitte gib eine gültige E-mail Adresse ein"
    
    @State private var successText: String = "Login erfolgreich!"
    
    
    
    
    
    
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
        
        
    }
    
    
    func passwordHasNumberAndCharacter(password: String) -> Bool {
        let passwordEvaluation = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordEvaluation)
        return passwordTest.evaluate(with: password)
    }
    
    func passwordHasCapitalLetter(password: String) -> Bool {
        let passwordEvaluation =  ".*[A-Za-z]+.*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordEvaluation)
        return passwordTest.evaluate(with: password)
    }
    
    
    var body: some View {
        
        VStack {
            if self.didSplashScreenFinishLoading {
                
                VStack {
                    
                    ZStack {
                        
                        LoginBackgroundView()
                        
                        
                        VStack{
                            
                            
                            Image(companyLogo)
                                .resizable()
                                .frame(width: 190, height: 80)
                            
                            Spacer().frame(height: 50)
                            
                            Text("Welcome back!").bold().foregroundColor(Color.white).font(.title)
                            
                            
                            Spacer().frame(height: 50)
                            
                            
                            
                            VStack(alignment: .center ){
                                
                                VStack(alignment: .leading){
                                    Text("E-MAIL").bold().font(.system(size: 14)).foregroundColor(self.lightGray)
                                    
                                    
                                    HStack{
                                        ZStack {
                                            VStack {
                                                
                                                TextField("Email", text: $email).foregroundColor(Color.white).padding( .leading, 15).frame(maxWidth: 350, maxHeight: 30)   .autocapitalization(.none).foregroundColor(Color.white)
                                                
                                                
                                            }
                                            
                                            VStack {
                                                
                                                
                                                if self.showEmailError {
                                                    
                                                    Image(systemName: "exclamationmark.circle.fill")
                                                        .foregroundColor(self.redColor).padding(.leading, 320)
                                                    
                                                    
                                                    
                                                }
                                            }
                                            
                                        }
                                    }
                                    
                                }
                                
                                VStack {
                                    
                                    if !redEmailAlert {
                                        Divider().frame(width: 350, height: 1, alignment: .center).background(Color.white)
                                        
                                    } else {
                                        
                                        Divider().frame(width: 350, height: 1, alignment: .center).background(self.redColor)
                                    }
                                    if showEmailError {
                                        ZStack {
                                            Rectangle()
                                                .fill(self.redColor)
                                                .frame(maxWidth: 350, maxHeight: 50)
                                            
                                            Text(self.emailErrorText).bold().foregroundColor(Color.white).font(.system(size: 16))
                                            
                                        }
                                    }
                                }
                                
                            }
                            
                            Spacer().frame(height: 15)
                            
                            VStack (alignment: .leading) {
                                
                                
                                Text("PASSWORT").bold().font(.system(size: 14)).foregroundColor(self.lightGray)
                                
                                
                                HStack {
                                    
                                    
                                    
                                    
                                    if self.showPassword {
                                        
                                        TextField("Password", text: $password).foregroundColor(Color.white).padding( .leading, 15).frame(maxWidth: 300, maxHeight: 30)    .autocapitalization(.none)
                                    } else {
                                        
                                        SecureField("Password", text: $password).foregroundColor(Color.white).padding( .leading, 15).frame(maxWidth: 300, maxHeight: 30)   .autocapitalization(.none)
                                        
                                    }
                                    
                                    
                                    
                                    
                                    VStack {
                                        
                                        
                                        if self.showPassword {
                                            
                                            Button(action: {
                                                
                                                self.showPassword = false
                                                
                                            }) {
                                                
                                                
                                                Image(systemName: "eye.slash.fill")
                                                    .foregroundColor(Color.white).padding(.leading, 10 )
                                                
                                            }
                                            
                                        } else {
                                            
                                            
                                            
                                            Button(action: {
                                                
                                                self.showPassword = true
                                                
                                            }) {
                                                
                                                Image(systemName: "eye.fill")
                                                    .foregroundColor(Color.white).padding(.leading, 10 )
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                    
            
                                
                                if !redPasswordAlert {
                                    Divider().frame(width: 350, height: 1, alignment: .center).background(Color.white)
                                } else {
                                    
                                    Divider().frame(width: 350, height: 1, alignment: .center).background(self.redColor)
                                }
                                
                                
                                
                            }.padding()
                            
                            
                            
                            Spacer().frame(height: 50)
                            
                            HStack {
                                Button(action: {
                                    
                                    if !self.textFieldValidatorEmail(self.email) || self.email.isEmpty {
                                        
                                        self.showEmailError = true
                                        self.redEmailAlert = true
                                        
                                    } else {
                                        self.showEmailError = false
                                        self.redEmailAlert = false
                                        
                                        self.isValidEmail = true
                                        
                                    }
                                    
                                    
                                    if self.password.count < 12 || !self.passwordHasNumberAndCharacter(password: self.password) || !self.passwordHasCapitalLetter(password: self.password) {
                                        
                                        self.showPasswordError = true
                                        self.redPasswordAlert = true
                                        
                                    } else {
                                        
                                        self.showPasswordError = false
                                        self.redPasswordAlert = false
                                        
                                        self.isValidPassword = true
                                        
                                    }
                                    
                                    if isValidEmail && isValidPassword {
                                        
                                        self.showLoginSuccess = true
                                        
                                    }
                                    
                                })   { Text("EINLOGGEN").bold()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(self.lightGray)
                                    .cornerRadius(5)
                                    .border(self.lightGray, width: 2)
                                    
                                }.frame(width: 350).shadow(radius: 50).alert(isPresented: self.$showPasswordError) {
                                    Alert(title: Text(self.passwordErrorText))}.alert(isPresented: self.$showLoginSuccess) {
                                        Alert(title: Text(self.successText))}
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                            
                            ViewBottom().frame(maxHeight: 200)
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                }
                
            } else {
                
                WelcomeScreen()
                
            }
            
        }  .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                withAnimation {
                    self.didSplashScreenFinishLoading = true
                }
                
            }
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



