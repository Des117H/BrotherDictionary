/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tu Gia Dinh
  ID: 3891542
  Created  date: 04/09/2022
  Last modified:
  Acknowledgement:
 https://stackoverflow.com/questions/34563329/how-to-play-mp3-audio-from-url-in-ios-swift
*/

import Foundation
import AVFoundation

final class Player {
	static var share = Player()
	private var player = AVPlayer()

	private init() {}

	func play(url: URL) {
		player = AVPlayer(url: url)
		player.allowsExternalPlayback = true
		player.appliesMediaSelectionCriteriaAutomatically = true
		player.automaticallyWaitsToMinimizeStalling = true
		player.volume = 1
		player.play()
	}
}
