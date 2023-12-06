//
//  ContentView.swift
//  CenoApp
//
//  Created by Mzoon AlRubaish on 21/05/1445 AH.
//

import SwiftUI
import AVKit
import AVFoundation

struct ContentView: View {
    @State private var playSound = true
    @State private var isPressed = false
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "CenoDemo", withExtension: "mov")!)
    
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .disabled(true)
        }
        .onAppear {
            player.play()
            player.rate = 1.1
            playAudio(rate: 0.9)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func playAudio(rate: Float) {
        if let soundURL = Bundle.main.url(forResource: "eyeblink", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.enableRate = true
                audioPlayer?.rate = rate
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
    }
}


#Preview {
    ContentView()
}
