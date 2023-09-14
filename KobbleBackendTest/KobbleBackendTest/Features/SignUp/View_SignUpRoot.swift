//
//  View_SignUpRoot.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/13/23.
//

import SwiftUI
import CoreLocation

struct VSignUpRoot: View {
    
    @State var current: Int? = 0
    
    var body: some View {
        NavigationView {
            
            VSignUp_PhoneNumber()
        }
    }
}

struct VSignUpRoot_Previews: PreviewProvider {
    static var previews: some View {
        VSignUpRoot()
    }
}

struct VSignUp_TopBar: View {
    var prog: Float
    var body: some View {
        VStack {
            HStack {
                ProgressView(value: prog)
            }
            .padding()
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

struct VSignUp_PhoneNumber: View {
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("May we have your number?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("To ensure a secure community, we confirm the authenticity of each user on Kobble.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    HStack {
                        Text("+1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                    }
                    .frame(width: 75, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 4)
                    }
                }
                
                
                TextField("Your number", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(14)
                    .shadow(radius: 4, y: 4)
                    .onChange(of: phoneNumber) { newValue in
                        userSignUpVar.phoneNumber = newValue
                    }
            }
            .padding()
            .padding(.top, 24)
            
            Spacer()
            
            HStack {
                Text("This is ")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                + Text("kept private")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                + Text(" and is")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                + Text(" never shared.")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    
                    
                Spacer()
                
                NavigationLink(destination: VSignUp_Name()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.0769)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_Name: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    //@Binding var modl: MUserSignUp
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What may we call you?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("Don't worry, you can change this later in the settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            TextField("Your first name", text: $firstName)
                .foregroundColor(.accentColor)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(height: 50)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(14)
                .shadow(radius: 4, y: 4)
                .padding()
                .padding(.top, 24)
                .onChange(of: firstName) { newValue in
                    userSignUpVar.firstName = newValue
                }
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_DOB()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.1538)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_DOB: View {
    @State private var birthDate: Date = Date()
    @State var s: String = ""
    @State var a: String = ""
    @State var age: Int?
    
    //@Binding var modl: MUserSignUp
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("When is your birthday?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You must be 18 years or older to register on Kobble.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    HStack {
                        Text("Jan")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                    }
                    .frame(width: 75, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 4)
                    }
                }
                
                
                TextField("Day", text: $s)
                    .keyboardType(.numberPad)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(14)
                    .shadow(radius: 4, y: 4)
                    .frame(width: 75)
                    .onChange(of: s) { _ in
                        calculateAge()
                        userSignUpVar.age = age
                    }
                
                TextField("Year", text: $a)
                    .keyboardType(.numberPad)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(14)
                    .shadow(radius: 4, y: 4)
                    .frame(width: 100)
                    .onChange(of: a) { _ in
                        calculateAge()
                        userSignUpVar.age = age
                    }
                
            }
            .padding()
            .padding(.top, 24)
            
            Spacer()
            
            HStack {
                Text("You can choose to show or hide this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_Gender()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.2307)
        }
        .navigationBarBackButtonHidden()
        
    }
    
    func calculateAge() {
        guard let dayInt = Int(s), let yearInt = Int(a) else {
            // Handle invalid input
            return
        }
        
        var components = DateComponents()
        components.day = dayInt
        components.month = 1 // January
        components.year = yearInt
        
        guard let birthDate = Calendar.current.date(from: components) else {
            // Handle invalid date
            return
        }
        
        let currentDate = Date()
        let ageComponents = Calendar.current.dateComponents([.year], from: birthDate, to: currentDate)
        
        age = ageComponents.year
    }
}

struct VSignUp_Gender: View {
    let genders = ["Male", "Female", "Other", "Prefer not to say"]
    //@State private var selectedGender: String = "Male"
    @State private var buttonInd = 1
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What is your gender?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("All genders are welcome on Kobble.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                Button {
                    buttonInd = 1
                    userSignUpVar.gender = "Male"
                } label: {
                    HStack {
                        Text("Male")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 1 ? .white : .accentColor)
                    }
                    .padding()
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonInd == 1 ? .accentColor : .white)
                            .shadow(radius: 4, y: 4)
                    }
                }
                
                
                Button {
                    buttonInd = 2
                    userSignUpVar.gender = "Female"
                } label: {
                    HStack {
                        Text("Female")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 2 ? .white : .accentColor)
                    }
                    .padding()
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonInd == 2 ? .accentColor : .white)
                            .shadow(radius: 4, y: 4)
                    }
                }
                
                Button {
                    buttonInd = 3
                } label: {
                    HStack {
                        Text("Other")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 3 ? .white : .accentColor)
                        
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 3 ? .white : .accentColor)
                    }
                    .padding()
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonInd == 3 ? .accentColor : .white)
                            .shadow(radius: 4, y: 4)
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            Spacer()
            
            HStack {
                
                Text("You can show or hide this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                Spacer()
                
                NavigationLink(destination: VSignUp_GenderPref()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.3076)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_GenderPref: View {
    let genders = ["Male", "Female", "Other", "Prefer not to say"]
    //@State private var selectedGender: String = ""
    @State private var buttonInd = 0
    
    //@Binding var modl: MUserSignUp
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("Who are you interested in?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("We use this decide who to recommend.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                Button {
                    buttonInd = 1
                    userSignUpVar.desiredGender = "Male"
                } label: {
                    HStack {
                        Text("Men")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 1 ? .white : .accentColor)
                    }
                    .padding()
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonInd == 1 ? .accentColor : .white)
                            .shadow(radius: 4, y: 4)
                    }
                }
                
                
                Button {
                    buttonInd = 2
                    userSignUpVar.desiredGender = "Female"
                } label: {
                    HStack {
                        Text("Women")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 2 ? .white : .accentColor)
                    }
                    .padding()
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonInd == 2 ? .accentColor : .white)
                            .shadow(radius: 4, y: 4)
                    }
                }
                
                Button {
                    buttonInd = 3
                } label: {
                    HStack {
                        Text("Other")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 3 ? .white : .accentColor)
                        
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(buttonInd == 3 ? .white : .accentColor)
                    }
                    .padding()
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(buttonInd == 3 ? .accentColor : .white)
                            .shadow(radius: 4, y: 4)
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            Spacer()
            
            HStack {
                Text("You can change this later.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                
                
                
                NavigationLink(destination: VSignUp_Height()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.3845)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_Height: View {
    
    @State private var selectedFeet: Int = 5
    @State private var selectedInches: Int = 6
    @State private var heightInCM: Double = 167.64 // Default to 5'6" in cm
    
    private var heightBinding: Binding<Double> {
        Binding(
            get: { self.heightInCM },
            set: { newValue in
                self.heightInCM = newValue
                let totalInches = newValue / 2.54
                self.selectedFeet = Int(totalInches) / 12
                self.selectedInches = Int(totalInches) % 12
            }
        )
    }
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("How tall are you?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            HStack {
                Spacer()
                Picker("Feet", selection: $selectedFeet) {
                    ForEach(4..<8) { i in
                        Text("\(i) ft").tag(i)
                    }
                }
                .frame(width: 100)
                .clipped()
                .pickerStyle(WheelPickerStyle())
                
                Picker("Inches", selection: $selectedInches) {
                    ForEach(0..<12) { i in
                        Text("\(i) in").tag(i)
                    }
                }
                .frame(width: 100)
                .clipped()
                .pickerStyle(WheelPickerStyle())
                
                Spacer()
            }
            .onChange(of: selectedFeet) { _ in
                heightBinding.wrappedValue = Double((selectedFeet * 12) + selectedInches) * 2.54
                //modl.height = heightInCM
                userSignUpVar.height = heightInCM
            }
            .onChange(of: selectedInches) { _ in
                heightBinding.wrappedValue = Double((selectedFeet * 12) + selectedInches) * 2.54
                //modl.height = heightInCM
                userSignUpVar.height = heightInCM
            }
            .padding()
            .padding(.top, 24)
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_educationLevel()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.4614)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_educationLevel: View {
    
    @State private var selectedPreference: educationLevelTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What is your education status?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(educationLevelTypes.allCases, id: \.self) { preference in
                    Button {
                        selectedPreference = preference
                        userSignUpVar.educationLevel = preference
                    } label: {
                        HStack {
                            Text(preference.rawValue)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                        }
                        .padding()
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                .shadow(radius: 4, y: 4)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_religion()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.5383)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_religion: View {
    
    @State private var selectedPreference: religionTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What religion do you practice?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 32) {
                    ForEach(religionTypes.allCases, id: \.self) { preference in
                        Button {
                            selectedPreference = preference
                            userSignUpVar.religion = preference
                        } label: {
                            HStack {
                                Text(preference.rawValue)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                            }
                            .padding()
                            .frame(height: 50)
                            .background {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                    .shadow(radius: 4, y: 4)
                            }
                        }
                    }
                }
                .padding()
                .padding(.top, 24)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_exerciseLevel()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.6152)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_exerciseLevel: View {
    
    @State private var selectedPreference: exerciseHabitsTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("How often do you workout?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(exerciseHabitsTypes.allCases, id: \.self) { preference in
                    Button {
                        selectedPreference = preference
                        userSignUpVar.exerciseLevel = preference
                    } label: {
                        HStack {
                            Text(preference.rawValue)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                        }
                        .padding()
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                .shadow(radius: 4, y: 4)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_alcoholPreference()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.6921)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_alcoholPreference: View {
    
    @State private var selectedPreference: alcoholPreferenceTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("How often do you drink?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(alcoholPreferenceTypes.allCases, id: \.self) { preference in
                    Button {
                        selectedPreference = preference
                        userSignUpVar.alcoholPreference = preference
                    } label: {
                        HStack {
                            Text(preference.rawValue)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                        }
                        .padding()
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                .shadow(radius: 4, y: 4)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 24)

            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_smokingPreference()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.769)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_smokingPreference: View {
    
    @State private var selectedPreference: smokingPreferenceTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What is your smoking preference?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(smokingPreferenceTypes.allCases, id: \.self) { preference in
                    Button {
                        selectedPreference = preference
                        userSignUpVar.smokingPreference = preference
                    } label: {
                        HStack {
                            Text(preference.rawValue)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                        }
                        .padding()
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                .shadow(radius: 4, y: 4)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_loveLanguage()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.8459)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_loveLanguage: View {
    
    @State private var selectedPreference: loveLanguageTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What is your love language?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(loveLanguageTypes.allCases, id: \.self) { preference in
                    Button {
                        selectedPreference = preference
                        userSignUpVar.loveLanguage = preference
                    } label: {
                        HStack {
                            Text(preference.rawValue)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                        }
                        .padding()
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                .shadow(radius: 4, y: 4)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_relationshipGoal()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 0.9228)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_relationshipGoal: View {
    
    @State private var selectedPreference: relationshipGoalTypes? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("What kind of relationship are you looking for?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("You can change this later, in settings.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 32) {
                ForEach(relationshipGoalTypes.allCases, id: \.self) { preference in
                    Button {
                        selectedPreference = preference
                        userSignUpVar.relationshipGoal = preference
                    } label: {
                        HStack {
                            Text(preference.rawValue)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedPreference == preference ? .white : .accentColor)
                        }
                        .padding()
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 14)
                                .foregroundColor(selectedPreference == preference ? .accentColor : .white)
                                .shadow(radius: 4, y: 4)
                        }
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            
            
            Spacer()
            
            HStack {
                Text("We show this on your profile.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_TraitQuiz()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 1.0)
        }
        .navigationBarBackButtonHidden()
    }
}

struct VSignUp_LocationPermission: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 48)
            
            Text("May we get your location?")
                .font(.system(size: 36))
                .fontDesign(.rounded)
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
                .padding()
            
            Text("We use this to find the best matches near you.")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(.horizontal)
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    HStack {
                        Text("Grant location permission")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(.white)
                            .shadow(radius: 4, y: 4)
                    }
                }
            }
            .padding()
            .padding(.top, 24)
            
            Spacer()
            
            HStack {
                Text("We")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                + Text(" never share ")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                + Text("this with anyone.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                
                Spacer()
                
                NavigationLink(destination: VSignUp_TraitQuiz()) {
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
            .padding(.vertical)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .overlay(alignment: .top) {
            VSignUp_TopBar(prog: 1.0)
        }
        .navigationBarBackButtonHidden()
    }
}
