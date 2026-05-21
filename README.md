# Weekly Expense Tracker 📊

A highly responsive, cross-platform Flutter application engineered to monitor personal finance dynamics. The application features real-time weekly expenditure aggregation, responsive viewport configuration, adaptive UI rendering, and strict memory boundary lifecycle tracking.

---

## 🛠️ Tech Stack & Architectural Framework

* **Framework:** Flutter & Dart SDK
* **State Management:** Localized lifting-of-state via custom reactive hooks (`setState`)
* **Formatting Engine:** `intl` package for structural localized string parsing and uniform date formatters
* **Component Rendering:** Material Design combined with platform-aware adaptive elements

### Project Structural Topology
```text
lib/
├── models/
│   └── Transaction.dart      # Strongly typed blueprint for transactional data schemas
├── widgets/
│   ├── chart.dart            # Multi-iteration mapping matrix calculation engine for weekly data
│   ├── chat_bar.dart         # Scaled structural interface for mathematical layout distribution
│   ├── newtransaction.dart   # Interactive transactional input worksheet with data boundary validators
│   └── transaction_list.dart # Virtualized item layout generator containing contextual entries
└── main.dart                 # Application bootstrap configuration, orientation guards, & core design hooks
