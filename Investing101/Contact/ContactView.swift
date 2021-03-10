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
                
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, -3)
                
                VStack{
                    Text("Who Are We")
                        .font(.custom("Verdana", size: 17))
                        .bold()
                        .padding(.bottom, 2)
                    
                    Text("We are a nonprofit organization designed to teach kids about courses such as investment and financial literacy to inspire them to pursue these topics for the future.")
                        .font(.custom("Arial", size: 15))
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                }
                .padding(.bottom, 10)
                
                VStack {
                    
                    Text("Meet The Developers")
                        .font(.custom("Verdana", size: 17))
                        .bold()
                        .padding(.bottom, 20)
                    
                    HorizontalDeveloperView(image: "ethan", name: "Ethan Fang", description: "I am a app developer who has coded multiple projects in Swift. I am interested in finance and computer science.", email: "ethanfang10@gmail.com", link: "https://www.linkedin.com/in/ethan-fang-bb0404161/")
                        .padding(.bottom, 20)
                      
                    HorizontalDeveloperView(image: "aayush", name: "Aayush Kadakia", description: "I am the founder of Alpha Business Club and I am interested in the world of finance and business.", email: "kadakiaaayush@gmail.com", link: "https://www.linkedin.com/in/aayush-kadakia-7939531ba/")
                        .padding(.bottom, 20)
                }
                .padding(.top, 20)
                
                Button(action: {
                    
                    MFMailComposeViewController.canSendMail() ? self.isShowingMailView.toggle() : self.alertNoMail.toggle()
                        }) {
                            Text("Email Us!")
                                .font(.custom("Verdana", size:16))

                        }
                        .padding([.top, .bottom], 16)
                        .padding([.leading, .trailing], 45)
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
