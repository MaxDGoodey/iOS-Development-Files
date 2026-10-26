print("Weekend Budget")
budget = 200
print(f"${budget}")
expenses = [{"name" : "Groceries", "amount" : 70, "category": "Essentials"}, {"name" : "Video Game", "amount" : 60, "category": "Fun"}, {"name" : "Food", "amount" : 300, "category" : "Essentials"}, {"name" : "Soda", "amount" : 12, "category" : "Fun"}]
for item in expenses:
    print(f"{item['name']}: ${item['amount']}")
def total_spent(expenses):
    total = 0
    for item in expenses:
        total += item['amount']
    return total
spent = total_spent(expenses)
# NameError: name 'sent' is not defined, line 13
print(spent)
print(budget - spent)
def budget_status(budget: int, spent: int):
    if budget - spent > 0:
        return "Under budget"
    elif budget - spent == 0:
        return "Right on budget"
    else:
        return "Over budget"
print(budget_status(budget, spent))
print(budget_status(100, 80))
print(budget_status(100, 100))


# Claude, there arent structs, the way functions are made are different, and swift is compiled and python isnt

def category_total(category, expenses):
    return sum(e["amount"] for e in expenses if e["category"] == category)

# Idiomatic
def biggest_expense(expenses):
    return max(expenses, key=lambda e: e["amount"], default=None)


trip_expenses = [
    {"name": "Groceries", "amount": 65, "category": "Food"},
    {"name": "Gas", "amount": 40, "category": "Travel"},
    {"name": "Pizza", "amount": 24, "category": "Food"},
    {"name": "Movie tickets", "amount": 30, "category": "Fun"},
]

print(f"Food: ${category_total('Food', trip_expenses)}")

biggest = biggest_expense(trip_expenses)
if biggest is not None:
    print(f"Biggest: {biggest['name']}, ${biggest['amount']}")

if biggest_expense([]) is None:
    print("No expenses yet")

print(f"Essentials: ${category_total('Essentials', expenses)}")

biggest2 = biggest_expense(expenses)
print(f"Biggest: {biggest2['name']}, ${biggest2['amount']}")