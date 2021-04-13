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

        ScrollView(showsIndicators: false){
                
                VStack {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: UIScreen.main.bounds.height * (1/11))
                    
                    Image("logo")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * (2/3), height: UIScreen.main.bounds.width * (2/3))
                        .padding(.top, -3)
                    
                    VStack{
                        Text("Who Are We")
                            .font(.custom("Verdana", size: 20))
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom, 2)
                        
                        Text("Here, at Alpha Finance, we strive to provide financial literacy to all students through our mobile app and course based education systems. One of the things our organization cherishes is feedback: if you have any questions, concerns, or suggestions regarding the mobile application platform please don’t hesitate to email us by clicking the button below.")
                            .font(.custom("Verdana", size: 15))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: UIScreen.main.bounds.width * (5/6))
                    }
                    .padding(.bottom, 25)
                    
                    Button(action: {
                        
                        MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                            }) {
                                Text("Email Us!")
                                    .foregroundColor(.black)
                                    .font(.custom("Verdana", size:16))

                            }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 40)
                            .background(
                            
                            Capsule()
                                .stroke(Color.black, lineWidth: 2)
                            )
                            .disabled(!MFMailComposeViewController.canSendMail())
                            .sheet(isPresented: $isShowingMailView) {
                                MailView(result: self.$result)
                            }
                            .alert(isPresented: self.$alertNoMail) {
                                Alert(title: Text("Mail App Not Setup"), dismissButton: .cancel())
                            }
                    
                }
                .padding(.bottom, 20)
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
