//  Scenario.swift
//  CenoApp
//
//  Created by Sara AlQuwaifli on 05/12/2023.
//

import SwiftUI
import AudioToolbox

struct Scenario: View {
    @State private var playSound = true
    @State private var showPopUp1 = false
    @State private var showPopUp2 = false
    @State private var showPopUp3 = false
    @State private var showPopUp4 = false
    @State private var showNextScreen = false
    @State private var drawingWidth: CGFloat = 0
    @State private var currentStep = 0
    let totalSteps = 3
    let stepDuration: Double = 1
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .leading) {
                    Text("Progress...")
                        .bold()
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color(.systemGray6))
                            .frame(width: 300, height: 12)
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.indigo)
                            .frame(width: drawingWidth, alignment: .leading)
                            .animation(.easeInOut(duration: stepDuration))
                    }
                    
                    Image("Ceno3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 250)
                    
                    Text("You want to make a choice that aligns with your interests and future career prospects. What would you do in this situation?")
                        .frame(width: 310, height: 100)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .font(.system(size: 15))
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Button(action: {
                                showPopUp1 = true
                            }) {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.20), radius: 4.6, x: 0, y: 0)
                                    .overlay(
                                        Text("Seek internship or part-time job")
                                            .multilineTextAlignment(.center)
                                            .lineLimit(nil)
                                            .foregroundColor(.black)
                                            .font(.system(size: 10))
                                    )
                            }
                            .sheet(isPresented: $showPopUp1) {
                                VStack(spacing: 20) {
                                    Text("Great choice!")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.bottom, 20)
                                    
                                    Text("Seeking internships or part-time jobs allows you to gain practical experience and exposure in your areas of interest. This hands-on experience will help you explore different career paths and make informed decisions.")
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Button(action: {
                                        nextStep()
                                    }) {
                                        Text("Okay")
                                            .bold()
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .frame(width: 227, height: 50)
                                            .background(Color(red: 0.23, green: 0.23, blue: 0.58))
                                            .cornerRadius(10)
                                    }
                                    .padding([.horizontal])
                                    .presentationDetents([.medium, .large])
                                }
                            }
                            
                            Button(action: {
                                showPopUp2 = true
                            }) {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.20), radius: 4.6, x: 0, y: 0)
                                    .overlay(
                                        Text("Choose based on societal expectations")
                                            .multilineTextAlignment(.center)
                                            .lineLimit(nil)
                                            .foregroundColor(.black)
                                            .font(.system(size: 10))
                                    )
                            }
                            .sheet(isPresented: $showPopUp2) {
                                VStack(spacing: 20) {
                                    Text("Oops!")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.bottom, 20)
                                    
                                    Text("Choosing a career path solely based on societal expectations and external pressures may not lead to long-term fulfillment. It's important to prioritize your own interests and aspirations when making career decisions.")
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Button(action: {
                                        nextStep()
                                    }) {
                                        Text("Okay")
                                            .bold()
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                            .frame(width: 227, height: 50)
                                            .background(Color(red: 0.23, green: 0.23, blue: 0.58))
                                            .cornerRadius(10)
                                    }
                                    .opacity(1)
                                    .presentationDetents([.medium, .large])
                                    .padding([.horizontal])
                                }
                            }
                        }
                        
                        HStack {
                            
                            Button(action: {
                                showPopUp3 = true
                            }) {
                                Rectangle()
                                    .frame(width: 150, height: 100)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.20), radius: 4.6, x: 0, y: 0)
                                    .overlay(
                                        Text("Research the job market and growth prospects")
                                            .multilineTextAlignment(.center)
                                            .lineLimit(nil)
                                            .foregroundColor(.black)
                                            .font(.system(size: 10))
                                    )
                                
                                    .sheet(isPresented: $showPopUp3)
                                {
                                    VStack(spacing: 20) {
                                        Text("Well done!")
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(.black)
                                            .padding(.bottom, 20)
                                        
                                        Text("Researching the job market can provides valuable insights, and future opportunities. But please note as this information will help you make informed decisions only to align your choices with your future goals not the other way around.")
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .foregroundColor(.black)
                                        
                                        Button(action: {
                                            nextStep()
                                        }) {
                                            Text("Okay")
                                                .bold()
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 227, height: 50)
                                                .background(Color(red: 0.23, green: 0.23, blue: 0.58))
                                                .cornerRadius(10)
                                        }
                                        
                                        .opacity(1)
                                        .presentationDetents([.medium, .large])
                                        .padding([.horizontal])
                                    }
                                }
                                Spacer().frame(width:20, height:0)
                                
                                Button(action: {
                                    showPopUp4 = true
                                }) {
                                    Rectangle()
                                        .frame(width: 150, height: 100)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.20), radius: 4.6, x: 0, y: 0)
                                        .overlay(
                                            Text("Go with the flow")
                                                .multilineTextAlignment(.center)
                                                .lineLimit(nil)
                                                .foregroundColor(.black)
                                                .font(.system(size: 10))
                                        )
                                }
                                .sheet(isPresented: $showPopUp4) {
                                    VStack(spacing: 20) {
                                        Text("Umm!")
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(.black)
                                            .padding(.bottom, 20)
                                        
                                        Text("Keep in mind that going with the flow without actively considering your interests and future prospects may lead to missed opportunities. It's important to be proactive in exploring your options and making choices that align with your goals and aspirations.")
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .foregroundColor(.black)
                                        
                                        
                                        Button(action: {
                                            nextStep()
                                        }) {
                                            Text("Okay")
                                                .bold()
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 227, height: 50)
                                                .background(Color(red: 0.23, green: 0.23, blue: 0.58))
                                                .cornerRadius(10)
                                        }
                                        
                                        .opacity(1)
                                        .presentationDetents([.medium, .large])
                                        .padding([.horizontal])
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                
                .frame(width: 300, height: 12)
                .onAppear {
                    startProgress()
                }
                .navigationBarTitle(Text("Scenario"), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .background(
                    NavigationLink(destination: AchivmentPop(), isActive: $showNextScreen) {
                        EmptyView()
                    }
                )
                
            }
        }
    }
    
    func startProgress() {
        drawingWidth = 0
        currentStep = 0
        showNextScreen = false
        animateToNextStep()
    }
    
    func animateToNextStep() {
        withAnimation(.easeInOut(duration: stepDuration)) {
            drawingWidth = CGFloat(currentStep) / CGFloat(totalSteps) * 300
        }
    }
    
    func nextStep() {
            currentStep += 1
            if currentStep > totalSteps {
                currentStep = 0
                

                if let soundURL = Bundle.main.url(forResource: "achievement_sound", withExtension: "mp3") {
                    var soundID: SystemSoundID = 0
                    AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
                    AudioServicesPlaySystemSound(soundID)
                }
                
                showNextScreen = true

                showPopUp1 = false
                showPopUp2 = false
                showPopUp3 = false
                showPopUp4 = false
            }
            animateToNextStep()
        }
    }
    
    struct Scenario_Previews: PreviewProvider {
        static var previews: some View {
            Scenario()
        }
    }
