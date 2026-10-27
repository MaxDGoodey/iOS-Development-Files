import Foundation

// change later

extension Topic {
    static let all: [Topic] = [
        Topic(
            title: "Hardware",
            icon: "cpu",
            summary: [
                QuestionAnswer(
                    question: "What are the main parts of a computer, and what does each one do?",
                    answer: "The CPU executes instructions and does the calculations. RAM holds the data and code currently in use. Storage (an SSD) keeps files long term. GPU handles small math processes over and over."
                ),
                QuestionAnswer(
                    question: "What's the difference between memory and storage?",
                    answer: "Memory is used temporarily and is very active, usually you have much less memory than storage. Storage is what keeps all of your apps when theyre not in use."
                ),
                QuestionAnswer(
                    question: "What's the difference between a input and output device?",
                    answer: "An input device is something that communicates to the CPU for user inputs. Examples include a mouse, a keyboard, and a mic. An output device is something the CPU communicates to in order to show information. Examples include a screen, speakers, and a haptic device."
                )
            ],
            example: "Think of a kitchen. The CPU is the chef, RAM is the countertop where ingredients being used right now sit, and storage is the pantry. A bigger countertop lets the chef work on more at once, but the pantry is where everything is kept when you go home."
        ),
        Topic(
            title: "Memory",
            icon: "memorychip",
            summary: [
                QuestionAnswer(
                    question: "What are the stack and the heap, and what goes in each?",
                    answer: "The stack is where information for functions are kept. It's temporary, and each stack is individual. The heap is where information for classes are kept. They aren't as temporary and aren't kept individually."
                ),
                QuestionAnswer(
                    question: "What happens when you copy a struct vs. copy a class?",
                    answer: "Copying a struct creates an independent copy, so changing one does not affect the other. Copying a class instance copies only the reference, so both variables point to the same object and a change through one is visible through the other."
                ),
                QuestionAnswer(
                    question: "How and when does RAM get distributed to different apps?",
                    answer: "The CPU decides what apps get what RAM, and how much each gets. If the app is actively running, it uses more RAM, and if it's in the background it uses much less."
                )
            ],
            example: "Think of a shared Google Doc. Copying a struct is like printing the document: you and a friend each hold your own paper, so scribbling on yours changes nothing on theirs. Copying a class is like sharing a link: everyone opens the same document, so an edit by one person shows up for all."
        ),
        Topic(
            title: "Algorithms and Big-O",
            icon: "chart.line.uptrend.xyaxis",
            summary: [
                QuestionAnswer(
                    question: "What is an algorithm, and what does Big-O describe?",
                    answer: "An algorithm is a finite, well-defined sequence of steps that solves a problem. Big-O describes how the number of steps (or amount of memory) grows as the input size n grows, focusing on the worst-case trend and ignoring constants. O(1) is constant, O(log n) grows slowly, O(n) grows in proportion to the input, and O(n²) grows very quickly."
                ),
                QuestionAnswer(
                    question: "How do linear search and binary search work, and what's the Big-O of each?",
                    answer: "Linear search checks each element in turn until it finds the target, so it is O(n). Binary search works on a sorted array: it checks the middle element, then discards the half that cannot contain the target, and repeats. Halving each time makes it O(log n), so a million items need only about 20 checks."
                ),
                QuestionAnswer(
                    question: "Why is looking something up in a Set or Dictionary faster than searching an array?",
                    answer: "Sets and dictionaries use hashing. A hash function turns the key into a number that points almost directly to where the item is stored, so a lookup takes O(1) on average, no matter how large the collection is. Searching an unsorted array means checking elements one by one, which is O(n). The trade-off is that hashed collections use more memory and the keys must be Hashable."
                )
            ],
            example: "Imagine trying to find a name in a printed phone book with 1,000 pages. Linear search is starting at page 1 and reading every name until you find it, which could take 1,000 pages. Binary search is opening to the middle, seeing whether your name comes before or after, and throwing away half the book, again and again, so you finish in about 10 steps. A Set or Dictionary is like a coat check: you hand over your ticket and the attendant goes straight to your coat, whether the room holds 10 coats or 10,000."
        ),
        Topic(
            title: "Systems Architecture",
            icon: "gearshape.2",
            summary: [
                QuestionAnswer(
                    question: "What does an operating system do?",
                    answer: "The OS manages the hardware and gives apps a safe way to use it. It schedules CPU time, allocates memory, manages files and storage, handles input and output devices, enforces security and permissions, and provides services such as networking."
                ),
                QuestionAnswer(
                    question: "What's the difference between a program, a process and a thread?",
                    answer: "A program is a file of instructions stored in storage. A process is a running instance of a program, with its own memory. A thread is a single path of execution inside a process. A process has at least one thread, and its threads share the process's memory."
                ),
                QuestionAnswer(
                    question: "Why does UI work have to happen on the main thread?",
                    answer: "UI frameworks like UIKit and SwiftUI are not safe to update from several threads at once, so they use one designated thread, the main thread, for drawing and handling touches. If you block it with slow work, the interface freezes. So slow work such as networking runs in the background, and results are handed back to the main thread to update the screen."
                )
            ],
            example: "Picture a busy restaurant. The operating system is the manager, deciding which cook gets which stove and keeping everyone out of each other's way. A program is a recipe card sitting in a drawer, and a process is a cook actually making that dish at their own station. Threads are the separate tasks that cook juggles, like chopping and stirring at the same time. The main thread is the one waiter who talks to customers. If that waiter walks into the kitchen to cook a slow dish, nobody gets served and the restaurant feels frozen, so slow jobs go to the kitchen staff and the waiter only delivers the finished plate."
        ),
        Topic(
            title: "The Internet",
            icon: "globe",
            summary: [
                QuestionAnswer(
                    question: "What happens when an app asks a server for data?",
                    answer: "The app builds a request (a URL, a method like GET, and optional headers or a body). DNS finds the server's IP address, a connection is opened, and the request is split into packets that travel across many routers. The server processes the request and sends back a response with a status code (such as 200 or 404) and data, often JSON, which the app then decodes and displays."
                ),
                QuestionAnswer(
                    question: "What do IP addresses and DNS do?",
                    answer: "An IP address is a number that identifies a device on a network and lets packets be routed to it. DNS (the Domain Name System) is the internet's phone book: it translates human-friendly names like example.com into IP addresses."
                ),
                QuestionAnswer(
                    question: "What is an API, and what does HTTPS add to HTTP?",
                    answer: "An API (Application Programming Interface) is a defined way for one piece of software to ask another to do something. A web API exposes URLs that apps can call to get or change data. HTTPS is HTTP wrapped in TLS encryption. It keeps data private from eavesdroppers, proves you are talking to the real server, and detects tampering."
                )
            ],
            example: "Ordering at a restaurant: the menu is the API, listing what you can ask for and how. The waiter carries your request to the kitchen (the server) and brings back a response. DNS is looking up the restaurant's address by name, and HTTPS is a sealed envelope so nobody on the way can read your order."
        ),
        Topic(
            title: "SOLID",
            icon: "square.stack.3d.up",
            summary: [
                QuestionAnswer(
                    question: "What does each letter in SOLID stand for?",
                    answer: "S: Single Responsibility, where a type should have one reason to change. O: Open/Closed, where code should be open to extension but closed to modification. L: Liskov Substitution, where a subtype must be usable anywhere its parent type is expected. I: Interface Segregation, where many small, focused protocols are better than one large one. D: Dependency Inversion, where high-level code should depend on abstractions (protocols), not concrete types."
                ),
                QuestionAnswer(
                    question: "Why do these principles make code easier to change?",
                    answer: "They keep pieces small, focused and loosely connected. A change in one place is then less likely to break something elsewhere, you can add features without rewriting working code, and you can swap in test doubles for real dependencies, which makes testing easier."
                ),
                QuestionAnswer(
                    question: "What does one of the principles look like in Swift code?",
                    answer: "Dependency Inversion: instead of a view model creating a specific network class itself, it depends on a protocol. The real service or a fake one for tests can be passed in without changing the view model."
                )
            ],
            example: "A lamp doesn't care where its power comes from. It only needs a standard wall outlet, so it works the same whether the electricity comes from solar panels, a wind farm or a battery backup."
        )
    ]
}
