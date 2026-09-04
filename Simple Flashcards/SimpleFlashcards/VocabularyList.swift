//
//  VocabularyList.swift
//  SimpleFlashcards
//
//  Created by Jane Madsen on 12/11/24.


// MARK: Instructions
// Each day, we will have a word of the day. Take a moment at the beginning of class to add the word to your vocabulary list here. (Feel free to add other words as well!)
// It's important that your syntax is correct. Several examples are provided below for you to refer to.
// To create a Vocab object, you only need to provide the word. All other fields are optional. For example, for a word with only a definition, you could type:

let exampleVocab = Vocab(word: "compiler", definition: "A program that translates human readable source code into binary.")

// If you get an error, check that your quotation marks, colons, brackets, parentheses, and commas are all placed correctly. Feel free to ask for help if you get stuck.
// To add images to your vocab, you'll need to first add them to the Assets folder. Then, set the referenceImage string to the name of the image in that folder.
// Ask for help if needed!


// MARK: Vocab Model and List

import Foundation

struct Vocab {
    var word: String
    var definition: String = ""
    var synonyms: [String] = []
    var notes: [String] = []
    var referenceImage: String = ""
    
    // Add words to your vocabulary list here. The order they are in below is the order they will appear in the app.
    static let list: [Vocab] = [
        Vocab(
            word: "constants",
            definition: "A constant is a value that cannot be altered during the execution of a program.",
            synonyms: ["Immutable Value"],
            notes: ["Declared using the 'let' keyword in Swift."],
            referenceImage: "constant"
        ),
        Vocab(
            word: "variables",
            definition: "A variable is a named storage that can hold a value and whose value can be changed during program execution.",
            synonyms: ["Mutable Value"],
            notes: ["Declared using the 'var' keyword in Swift."],
            referenceImage: "variable"
        ),
        Vocab(
            word: "strings",
            definition: "A string is a sequence of characters used to represent text.",
            synonyms: ["Text", "Character Sequence"],
            notes: ["In Swift, strings are declared using double quotes (\" \")."],
            referenceImage: "string"
        ),
        Vocab(
            word: "functions",
            definition: "A function is a reusable block of code that performs a specific task.",
            synonyms: ["Method", "Procedure"],
            notes: ["Defined using the 'func' keyword in Swift."],
            referenceImage: "func"
        ),
        Vocab(
            word: "arrays",
            definition: "An array is a collection of elements stored in a specific order.",
            synonyms: ["List", "Sequence"],
            notes: ["Arrays in Swift are zero-indexed and declared using square brackets []."],
            referenceImage: "array"
        ),
        Vocab(
            word: "methods",
            definition: "A method is a function associated with a specific type, such as a class, struct, or enum.",
            synonyms: ["Member Function"],
            notes: ["Methods are called on instances of a type."],
            referenceImage: "method"
        ),
        Vocab(
            word: "classes",
            definition: "A class is a blueprint for creating objects, providing initial values for properties and implementations of behavior.",
            synonyms: ["Object Blueprint"],
            notes: ["Classes support inheritance and are declared using the 'class' keyword in Swift."],
            referenceImage: "class"
        ),
        Vocab(
            word: "structs",
            definition: "A struct is a value type that encapsulates properties and methods.",
            synonyms: ["Structure", "Value Type"],
            notes: ["Structs in Swift are declared using the 'struct' keyword and are copied when assigned."],
            referenceImage: "struct"
        ),
        Vocab(
            word: "IDE",
            definition: "Software that helps you write code by providing a code editor, a compiler, debugging tools, file management, etc.",
            synonyms: ["Integrated Development Environment", "Code Editor"],
            notes: ["Xcode is our IDE. Others include VS Code, Eclipse, or IntelliJ"],
            referenceImage: ""
        ),
        Vocab(
            word: "compiler",
            definition: "A program that translates human readable source code into machine readable binary.",
            synonyms: ["Translator"],
            notes: ["Commanly part of the IDE but can be a standalone tool. Part of Xcode that flags your errors in red."],
            referenceImage: ""
        ),
        Vocab(
            word: "immutable",
            definition: "A value or variable that dcannot be modified after initialization.",
            synonyms: ["Constant", "Unchangeable"],
            notes: ["'let' in swift declares immutability"],
            referenceImage: ""
        ),
        Vocab(
            word: "console",
            definition: "Interface within Xcode where devs can view and interact with runtime output generated by their application.",
            synonyms: ["Output", "Window", "Terminal", "Log"],
            notes: ["This is where print() statements output"],
            referenceImage: ""
        ),
        Vocab(
            word: "syntax",
            definition: "The set of rules that defines the combinations of symbols that are considered to be correctly structered programs in a language.",
            synonyms: ["Grammar"],
            notes: ["Syntax mistakes are the most common kind of error and will almost always be flagged in red by the compiler"],
            referenceImage: ""
        ),
        Vocab(
            word: "type safe",
            definition: "The extent to which a programming language prevents or discourages type errors.",
            synonyms: ["Cast", "as"],
            notes: ["Swift uses static enforcement of type safety, meaning it enforces type safety rules at compile time"],
            referenceImage: ""
        ),
        Vocab(
            word: "literal",
            definition: "A fixed value in source code, such as numbers, strings, or bools.",
            synonyms: ["Fixed value"],
            notes: ["examples: 42, Hello, true"],
            referenceImage: ""
        ),
        Vocab(
            word: "interpolation",
            definition: "Embedding variables or expressions in a string literal.",
            synonyms: ["String formatting", "Insertion"],
            notes: ["swift uses /(variable) for interpolation"],
            referenceImage: ""
        ),
        Vocab(
            word: "conditional",
            definition: "Logic code that executes different paths based on chosen conditions",
            synonyms: ["Branching", "Decision making"],
            notes: ["Includes if, else, switch astatements, and ternaries"],
            referenceImage: ""
        ),
        Vocab(
            word: "React",
            definition: "Free open source frontend Javascript library used for building dyanmic web user interfaces",
            synonyms: ["Components", "virtual DOM", "declarative", "dsx", "unidirectional data-flow"],
            notes: ["similar in concept to swift-UI, virtual DOM is similar to the struct based view hierarchy. Swift-UI DSL similar in purpose to JSX. Data is also unidirectional in both."],
            referenceImage: ""
        ),
        Vocab(
            word: "Function Signature",
            definition: "The name, parameters, and return type of a function.",
            synonyms: ["prototype", "definition"],
            notes: ["define show a function should be called"],
            referenceImage: ""
        )
    ]
}
