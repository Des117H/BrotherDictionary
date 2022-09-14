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
*/

import Foundation

// MARK: - WordElement
struct WordElement: Codable {
    let word: String
    let phonetics: [Phonetic]
    let meanings: [Meaning]
	
	init() {
		self.word = ""
		self.phonetics = [Phonetic()]
		self.meanings = [Meaning()]
	}
    
    init(word: String, phonetics: [Phonetic], meanings: [Meaning]) {
        self.word = word
        self.phonetics = phonetics
        self.meanings = meanings
    }
}
// MARK: - Meaning
struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
	init() {
		self.partOfSpeech = ""
		self.definitions = [Definition()]
	}
    init(partOfSpeech: String, definitions: [Definition]) {
        self.partOfSpeech = partOfSpeech
        self.definitions = definitions
    }
}

// MARK: - Definition
struct Definition: Codable {
    let definition: String
	init () {
		self.definition = ""
	}
    init(definition: String) {
        self.definition = definition
    }
}

// MARK: - Phonetic
struct Phonetic: Codable {
    let audio: String
    let text: String?
	
	init() {
		self.audio = ""
		self.text = ""
	}
    
    init(audio: String, text: String) {
        self.audio = audio
        self.text = text
    }
}

typealias WordJSON = [WordElement]
