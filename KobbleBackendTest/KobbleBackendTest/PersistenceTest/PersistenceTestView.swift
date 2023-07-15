//
//  PersistenceTestView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/10/23.
//

import SwiftUI
import Firebase

struct PersistenceTestView: View {
    var body: some View {
        Button(action: {
            self.fetchData()
        }) {
            Text("Fetch traits")
        }
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        db.collection("traits").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let source = querySnapshot!.metadata.isFromCache ? "local cache" : "server"
                    print("Data came from \(source)")
                }
            }
        }
    }
}

struct PersistenceTestView_Previews: PreviewProvider {
    static var previews: some View {
        PersistenceTestView()
    }
}
