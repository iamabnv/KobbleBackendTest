//
//  View_SignUp_TraitQuiz.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/14/23.
//

import SwiftUI
import FirebaseFunctions

struct VSignUp_TraitQuiz: View {
    @State private var phoneNumber: String = ""
    
    @State var s: das = das()
    
    @State private var currentQuestionIndex: Int = 0
    @State private var selectedChoice: Choice? = nil

    @State var userAnser: [[String : Any]] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            VStack(alignment: .leading, spacing: 24) {
                // Display the current question
                Text((s.rands?.questions[currentQuestionIndex].text)!)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(.accentColor)
                
                // Enumerate choices as buttons
                VStack(alignment: .center, spacing: 32) {
                    ForEach((s.rands?.questions[currentQuestionIndex].choices)!, id: \.text) { choice in
                        Button {
                            selectedChoice = choice
                            if userAnser.count >= currentQuestionIndex + 1 {
                                userAnser[currentQuestionIndex] = ["setid": (s.rands?.setid)!, "questionid": currentQuestionIndex, "choice": choice.text, "choicenumber": (s.rands?.questions[currentQuestionIndex].choices.index(of: choice))!, "traits": choice.traits]
                            }
                            else {
                                userAnser.append(["setid": (s.rands?.setid)!, "questionid": currentQuestionIndex, "choice": choice.text, "choicenumber": (s.rands?.questions[currentQuestionIndex].choices.index(of: choice))!, "traits": choice.traits])
                            }
                        } label: {
                            HStack {
                                Text(choice.text)
                                    .font(.system(size: 20))
                                    .minimumScaleFactor(0.1)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedChoice == choice ? .white : .accentColor)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundColor(selectedChoice == choice ? .accentColor : .white)
                                    .shadow(radius: 1, x: 0, y: 0)
                            }
                        }
                    }
                }
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
            }
            .padding()
            .padding(.top, 18)
            
            Spacer()
            
            HStack {
                
                
                Spacer()
                
                Button {
                    if currentQuestionIndex < (s.rands?.questions.count)! - 1 {
                        currentQuestionIndex += 1
                        selectedChoice = nil
                    }
                } label: {
                    if currentQuestionIndex < (s.rands?.questions.count)! - 1 {
                        Image(systemName: "chevron.right")
                            .font(.title3)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                            .frame(width: 75, height: 50)
                            .background {
                                Circle()
                                    .foregroundColor(.white)
                                    .shadow(radius: 4, y: 4)
                                
                            }
                    } else {
                        NavigationLink(destination: VSignUp_Final(userAns: $userAnser)) {
                            Image(systemName: "chevron.right")
                                .font(.title3)
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                                .frame(width: 75, height: 50)
                                .background {
                                    Circle()
                                        .foregroundColor(.white)
                                        .shadow(radius: 4, y: 4)
                                    
                                }
                        }
                    }
                }
                .padding(.vertical)
                .padding(.horizontal)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.7)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            //print(userQualities)
            //print(userRatingsMapa)
            //das()
        }
    }
}

struct VSignUp_TraitQuiz_Previews: PreviewProvider {
    static var previews: some View {
        VSignUp_TraitQuiz()
    }
}


struct VSignUp_Final: View {
    
    @Binding var userAns: [[String : Any]]
    
    var userId = "9QQFKaOuZlRy2IhjbQXh"
    
    var body: some View {
        VStack {
            Text("Welcome to Kobble")
            
            Button("Submit registration")
            {
                let d = das()
                userSignUpVar.traits =  das.calculateTraitRatings(userAnswers: userAns)
                userSignUpVar.desiredTraits = das.computeDesiredPartnerTraits(userScores: userSignUpVar.traits!, compatibilityMatrix: d.compatibilityMatrix!)
                userSignUpVar.desiredAge = userSignUpVar.age
                userSignUpVar.desiredHeight = userSignUpVar.height
                d.addGameSessionToFirestore { (error, documentId) in
                    if let error = error {
                        print("An error occurred: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let documentId = documentId else {
                        print("Document ID not found")
                        return
                    }
                    
                    // Initialize Cloud Functions
                    let functions = Functions.functions(region: "us-east4")
                    
                    // Prepare the payload
                    let payload: [String: Any] = ["userDocId": documentId]
                    
                    // Call the Cloud Function
                    functions.httpsCallable("createUserVector").call(payload) { (result, error) in
                        if let error = error as NSError? {
                            // Handle the error
                            print("An error occurred: \(error.localizedDescription)")
                        }
                        
                        if let resultData = (result?.data as? [String: Any]) {
                            // Handle the result
                            print("Result data: \(resultData)")
                        }
                    }
                }
            }
            
            Button("join queue")
            {
                let functions = Functions.functions(region: "us-east4")
                
                // Prepare the payload
                let payload: [String: Any] = ["userDocId": userId]
                
                // Call the Cloud Function
                functions.httpsCallable("getOpponentPlayer").call(payload) { (result, error) in
                    if let error = error as NSError? {
                        // Handle the error
                        print("An error occurred: \(error.localizedDescription)")
                    }
                    
                    if let resultData = (result?.data as? [String: Any]) {
                        // Handle the result
                        print("Result data: \(resultData)")
                    }
                }
            }
        }
        .onAppear {
        }
    }
}
