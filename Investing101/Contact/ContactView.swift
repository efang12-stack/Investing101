//
//  ContactView.swift
//  Investing101
//
//  Created by Ethan on 1/14/21.
//

import SwiftUI
import UIKit
import MessageUI

struct ContactView: View {
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var alertNoMail = false
    
    var body: some View {
        ScrollView{
            
            VStack {
                
                Text("Contact Us")
                    .font(.system(size: 35, weight: .bold))
                    .padding(.top, 20)
                
                Text("Don't hesitate to send us an email if you have any questions or concerns!")
                    .font(.custom("Verdana", size: 16))
                    .foregroundColor(Color.darkGray)
                    .frame(width: 300, height: 60)
                    .multilineTextAlignment(.center)
                
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, -3)
                
                
                Button(action: {
                    
                    MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                        }) {
                            Text("Email Us!")
                                .foregroundColor(.white)
                                .font(.custom("Verdana", size:18))

                        }
                        .padding([.top, .bottom], 22)
                        .padding([.leading, .trailing], 60)
                        .background(Color.black)
                        .cornerRadius(40)
                        .shadow(color: .black, radius: 1, x: 0, y: 0 )
                        .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $isShowingMailView) {
                            MailView(result: self.$result)
                        }
                        .alert(isPresented: self.$alertNoMail) {
                            Alert(title: Text("Mail App Not Setup"), dismissButton: .cancel())
                        }
                
                Divider()
                    .padding(.top, 20)
                
                VStack {
                    
                    Text("Meet The Developers")
                        .font(.custom("Verdana", size: 17))
                        .foregroundColor(Color.darkerGray)
                        .bold()
                        .padding(.bottom, 20)
                    
                        
                        HStack{
                            Image("ethan")
                                .resizable()
                                .frame(width: 100, height: 120)
                                .cornerRadius(5)
                            
                            VStack{
                                Text("Ethan Fang")
                                    .bold()
                                    .font(.custom("Arial", size: 18))
                                    .foregroundColor(Color.darkGray)
                                    .frame(width: 270)
                                    .padding(.bottom, 5)
                                
                                Text("Email: ethanfang10@gmail.com")
                                    .font(.custom("Verdana", size: 15))
                                    .foregroundColor(Color.lightGray2)
                                    .frame(width: 270)
                                
                                Link( destination: URL(string: "https://www.linkedin.com/in/ethan-fang-bb0404161/")!, label: {
                                    
                                    HStack {
                                        Text("LinkedIn")
                                            .font(.custom("Verdana", size: 18))
                                            .foregroundColor(Color.darkBlue)
                                            
                                            
                                        
                                        Image("linkedin")
                                            .resizable()
                                            .frame(width: 45, height: 37)
                                    }
                                })
                                
                                Spacer()
                                
                            }
                        }
                        .padding(.bottom, 20)
                    
                        
                        HStack{
                            Image("aayush")
                                .resizable()
                                .frame(width: 100, height: 120)
                                .cornerRadius(5)
                            
                            VStack{
                                Text("Aayush Kadakia")
                                    .bold()
                                    .font(.custom("Arial", size: 18))
                                    .foregroundColor(Color.darkGray)
                                    .padding(.bottom, 5)
                                    .frame(width: 270)
                                    
                                
                                Text("Email: kadakiaaayush@gmail.com")
                                    .font(.custom("Verdana", size: 15))
                                    .foregroundColor(Color.lightGray2)
                                    .frame(width: 270)
                                
                                Link( destination: URL(string: "https://www.linkedin.com/in/aayush-kadakia-7939531ba/")!, label: {
                                    
                                    HStack {
                                        Text("LinkedIn")
                                            .font(.custom("Verdana", size: 18))
                                            .foregroundColor(Color.darkBlue)
                                            
                                         
                                        
                                        Image("linkedin")
                                            .resizable()
                                            .frame(width: 45, height: 37)
                                    }
                                })
                                    
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 20)
                    
                }
                .padding(.top, 20)
            }
        }
    }
}


struct MailView: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["contactus.alphafinance@gmail.com"])
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
