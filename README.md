## 💎 Featured Core Implementations

### 💸 Real-Time Expense Tracking & Aggregation
Even within a lightweight data footprint, the application showcases robust data-handling architecture by managing financial lifecycles locally:
* **Dynamic State Injection:** Users can instantly create, validate, and inject new transactions into the active viewport stream.
* **Algorithmic ID Allocation:** Features a custom string-parsing routine (`createID`) that reads existing record states and automatically computes unique, non-colliding entity identifiers at runtime.
* **Safe Eviction Data Flow:** Implements a declarative filtering pattern via `.removeWhere()` to cleanly purge transaction records from memory by their unique ID, instantly triggering a structural interface re-render.

### 📊 Trailing 7-Day Data Visualization (The Chart Engine)
The core highlight of the application is a data aggregation system that dynamically charts weekly financial cycles:
* **Time-Delta Filtering:** Uses complex data filtering with `DateTime.now().subtract(Duration(days: 7))` to isolate and extract only the expenditures incurred over the trailing seven days.
* **Algorithmic Mapping Matrix:** Runs a multi-pass iteration loops to calculate the exact sum spent on each matching day of the week, mapping the index directly to localized day initials (e.g., "M", "T", "W").
* **Proportional Scaling Graph:** Computes total combined weekly spending using the `.fold()` accumulator method, dividing daily individual spend limits against the global total to generate a dynamic, mathematically accurate `heightFactor` percentage for each bar.

### 📱 Responsive Viewport Engineering & Performance
* **Adaptive Orientation Shifts:** Intercepts and scales layouts dynamically based on device position. Portrait execution optimizes data density (30% graph allocation / 70% list tracking), while Landscape mode transitions into an adaptive toggle system allowing users to smoothly switch between structural analytics and content streams.
* **Keyboard Overflow Mitigation:** Wraps form viewports inside a reactive `SingleChildScrollView` paired with a dynamic `MediaQuery.of(context).viewInsets.bottom` padding layout. This actively prevents sudden virtual keyboard display actions from triggering system UI container layout crashes.
* **Efficient Memory Boundaries:** Utilizes modular, decoupled presentation states alongside low-impact text controllers, ensuring smooth animations and low CPU overhead during data mutations.
* 
