//
//  SavedView.swift
//  Investing101
//
//  Created by Ethan on 1/29/21.
//

import SwiftUI

struct SavedView: View {
    
    @State var idArray: [String] = []
    let defaults = UserDefaults.standard
    
    var body: some View {
        Button(action: {
            defaults.removeObject(forKey: "savedArticleIDs")
        }, label: {
            Text("Hello World")
        })
            .onAppear {
                if let array = defaults.stringArray(forKey: "savedArticleIDs") {
                    print(array)
                }else{
                    print("Nothing saved")
                }
            }

    }
    }

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
