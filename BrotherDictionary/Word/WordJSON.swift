/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tu Gia Dinh
  ID: 3891542
  Created  date: 04/09/2022
  Last modified:
  Acknowledgement: Acknowledge the resources that you use here.
*/
//   let word = try? newJSONDecoder().decode(Word.self, from: jsonData)

import Foundation

// MARK: - WordElement
struct WordElement: Codable {
	let word: String
	let phonetics: [Phonetic]
	let meanings: [Meaning]
}
// MARK: - Meaning
struct Meaning: Codable {
	let partOfSpeech: String
	let definitions: [Definition]
}

// MARK: - Definition
struct Definition: Codable {
	let definition: String
}

// MARK: - Phonetic
struct Phonetic: Codable {
	let audio: String
	let text: String?
}

typealias WordJSON = [WordElement]
