## 💎 Key Features

### 💸 Dynamic Expense Tracking
* **Add & Track:** Users can instantly add new expenses with a title, cost, and custom date.
* **Auto-ID Generation:** Features a smart helper function (`createID`) that automatically calculates a unique ID for every new transaction so data never conflicts.
* **Easy Deletion:** Implements a clean delete function that instantly removes an expense from the list and updates the screen smoothly.

### 📊 Weekly Spending Chart
* **7-Day Filter:** Automatically filters your expenses to only show what you spent over the last 7 days.
* **Smart Math Calculation:** Uses the `.fold()` method to calculate your total weekly spending, then dynamically scales the height of each bar to show exactly what percentage of your budget went to each day.
* **Zero-Spend Safeguard:** Built-in logic ensures that if you have zero spending, the app displays cleanly without crashing from a "divide by zero" mathematical error.

### 📱 Full Responsiveness & Device Support
* **Portrait Mode:** Allocates 30% of the screen to the chart and 70% to the transaction list for standard vertical reading.
* **Landscape Mode:** Automatically swaps the layout when you turn your phone sideways, adding a "Show Chart" toggle switch so the user can easily switch views.
* **Anti-Keyboard Crash:** Uses responsive keyboard padding (`viewInsets.bottom`) so the phone's keyboard never overlaps or crashes the input form when typing.
* **Performance Focused:** Uses a virtualized `ListView.builder` to render your items on-demand, keeping the application fast and lightweight.
