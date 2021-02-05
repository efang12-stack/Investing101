//
//  DisplayView.swift
//  Investing101
//
//  Created by Ethan on 1/22/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DisplayView: View {
    
    @State var chosenArticle: Article
    @ObservedObject var savedArticleManager = SavedArticleManager()
    
    
    var body: some View {
        
    
     
                VStack{
                    
                        ScrollView{

                            VStack {


                                Text(chosenArticle.title)
                                    .font(.custom("Arial", size: 30))
                                    .bold()
                                    .frame(width: 345)
                                    .padding([.leading,.trailing], 30)
                                    .padding(.top, 10)

                                WebImage(url: URL(string: chosenArticle.image))
                                    .resizable()
                                    .frame(width: 340, height: 250)
                                    .cornerRadius(5)

                                HStack {

                                    Text("by "+(chosenArticle.author))
                                        .foregroundColor(Color.darkerGray)
                                        .font(.custom("Verdana", size: 17))
                                        .frame(width: 330, alignment: .leading)
                                        .padding([.bottom, .leading], 35)
                                        .padding(.top, 5)
                                        

                                    Spacer()
                                }

                                Text(chosenArticle.text)
                                    .font(.custom("Times New Roman", size: 21))
                                    .padding([.leading, .trailing], 20)
                                
                                Text("If you are interested in writing for us, send us an email at alphafinancial@gmail.com.")
                                    .foregroundColor(.lightGray2)
                                    .font(.custom("Verdana", size: 16))
                                    .frame(width: 300)
                                    .padding(.top, 25)

                                Spacer()
                            }
                        }
                        
 
        
                }
                .padding([.top, .bottom], 15)
                .navigationBarTitle(chosenArticle.category, displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    savedArticleManager.setArticleIDs()

                    if !savedArticleManager.savedArticleIds.contains(chosenArticle.id!) {

                        guard let chosenArticleID = chosenArticle.id else {
                            fatalError("articleID is nil")
                        }
                        
                        savedArticleManager.saveArticle(withID: chosenArticleID)
                        
                        savedArticleManager.setArticleIDs()
                        
                        
                    }
            
                    else {

                        guard let chosenArticleID = chosenArticle.id else {
                            fatalError("articleID is nil")
                        }
                        
                        savedArticleManager.deleteArticle(withID: chosenArticleID)
                        
                        savedArticleManager.setArticleIDs()

                    }
                    
                }, label: {
                    
                    
                    if savedArticleManager.savedArticleIds.contains(chosenArticle.id!) {
                        Image(systemName: "bookmark.fill")

                    }
                    else {
                        
                        Image(systemName: "bookmark")
                    }
                        
                }))
                .onAppear{
                    savedArticleManager.setArticleIDs()
                }
                
               
        
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(chosenArticle: Article(title: "How to Build A Company", text: "This is the first part to building a company", image: "", category: "Fin Tech", author: "Ethan Fang"))
    }
}
