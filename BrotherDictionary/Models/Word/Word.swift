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
 Canvas
*/

import Foundation

struct Word: Codable, Identifiable {
	var id = UUID()
	let word: String
	let pronunciation: String
	let definitions: [String: [String]]
	let audioUrl: String
	var userEdit: String?
	let wordForms: [String]
	
	init() {
		self.word = ""
		self.pronunciation = ""
		self.definitions = ["":[""]]
		self.audioUrl = ""
		self.wordForms = [""]
	}
	
	init(word: String, pronunciation: String, definiton: [String: [String]], audioUrl: String, wordForms: [String]) {
		self.word = word
		self.pronunciation = pronunciation
		self.definitions = definiton
		self.audioUrl = audioUrl
		self.wordForms = wordForms
	}
}


