fun main() {
    fun budgetStatus(budget: Int, spent: Int): String {
        if (budget - spent > 0) {
            return "Under budget"
        } else if (budget - spent == 0) {
            return "Right on budget"
        } else {
            return "Over budget"
        }
    }
    
    println(budgetStatus(budget = 100, spent = 120))
    println(budgetStatus(budget = 100, spent = 100))
    println(budgetStatus(budget = 100, spent = 10))
}
// C++, I'd like to learn how to make videogames. https://isocpp.org/. Unity. Probably that budget program as a good start to introduce variables, functions, arrays, dictionaries, and if statements.