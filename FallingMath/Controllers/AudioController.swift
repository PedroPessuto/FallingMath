//
//  AudioController.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 01/02/24.
//

import Foundation
import AVFoundation

@Observable class AudioController {

    var musicEnabled: Bool = true
    
    var musicPlayer: AVAudioPlayer?

    func startSound() {
        if let path = Bundle.main.path(forResource: "MusicaFallingMath", ofType: "mp3") {
            do {
                musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                musicPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }

    func toggleMuteMusic() {
        if let player = musicPlayer {
            if player.isPlaying {
                player.pause()
            } else {
                player.play()
            }
        }
    }
    
    init() {
        // Inicia a música
        // self.startSound()
    }
}
