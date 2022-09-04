/*
RMIT University Vietnam
Course: COSC2659 iOS Development
Semester: 2022B
Assessment: Assignment 3
Author: Tu Gia Dinh
ID: 3891542
Created  date: 26/07/2022
Last modified:
Acknowledgement:
 https://stackoverflow.com/a/57727718
*/

import Foundation
import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

func getDocumentsDirectory() throws -> URL {
	 return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
}

extension String {
	var lowercase: String { return "abcdefghijklmnopqrstuvwxyz" }
	
	mutating func replace(at index: Int, with character: Character) {
		var stringArray = Array(self)
		stringArray[index] = character
		self = String(stringArray)
	}
}

func indexOf(character: Character, _ array: [String]) -> Int {
	return array.firstIndex(of: String(character))!
}


func characterAt(index: Int, _ array: [String]) -> Character {
	return index < array.count ? Character(array[index])
							   : Character("")
}


func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
	var str: String = string

	if str.count <= 0 {
		str.append(characterAt(index: 0, array))
	}
	else {
		str.replace(at: str.count - 1,
					with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

		if indexOf(character: str.last!, array) == 0 {
			str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
		}
	}

	return str
}

func writeToFile() -> String {
	// Writing to the file named Test
	var password = ""
	let ALLOWED_CHARACTERS:   [String] = String().lowercase.map { String($0) }

	while (password.count <= 7) {
		password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
		let result = decoceJsonFileToStruct(wordSearch: password)
		if result[0].word != "" {
			print(result[0].word)
		}
	}
	
	return ""
}
