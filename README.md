# 📱 Flutter Pair Programming Challenge

## Direct Sales — Digital Store Sharing

### 📌 Context

This project simulates a **real-world pair programming challenge** inspired by the **Grupo Boticário – Direct Sales (Venda Direta)** domain.

The goal is to model a small but realistic feature that could exist in the **Minha Loja Digital** app, focusing on **business understanding, architectural decisions, and collaboration**, rather than UI polish.

---

## 🎯 Problem Statement

Direct Sales consultants promote their **Digital Store** by sharing links through channels like WhatsApp and social media.

To support this journey, the app should provide **recommended sharing actions**, allowing consultants to:

* understand what to share,
* take action,
* track completion.

---

## ✅ Solution Overview

This project implements a **Recommendation Actions screen** where the consultant can:

* view recommended sharing actions,
* share a store link (simulated),
* mark actions as completed.

The solution prioritizes:

* clean separation of responsibilities,
* business-driven modeling,
* simplicity and extensibility.

---

## 🧩 Functional Requirements

* List recommendation actions
* Each action contains:
  * `title`
  * `description`
  * `type` (e.g. share link)
  * `status` (pending / done)
* Allow marking an action as completed
* UI states:
  * loading
  * success
  * empty
  * error

---

## 🧱 Technical Decisions

* **Flutter**
* **Clean Architecture principles**
* Stateless Widgets only
* Business rules isolated from UI
* Fake / mock datasource (no real backend)
* State handled outside the view

---

## 🏗️ Architecture Overview

```
presentation
 └── controller / view model
 └── states
 └── pages

domain
 └── entities
 └── repositories
 └── usecases

data
 └── datasources
 └── models
 └── repository implementations
```

**Key principle:**

> The domain layer does not depend on Flutter, UI, or infrastructure details.

---

## 🔄 Data Flow

1. UI triggers an action
2. Controller invokes a Use Case
3. Use Case communicates with Repository
4. Repository retrieves data from datasource
5. Result returns as domain entities
6. UI reacts to state changes

---

## 🧪 Testing Strategy

* Unit tests for:

  * Use cases
  * Business logic
* Widget tests only for critical flows (if applicable)

The focus is **confidence in business behavior**, not coverage numbers.

---

## 🚀 Possible Extensions

If the feature evolves, this structure supports:

* backend-driven recommendations
* offline-first behavior
* analytics and tracking events
* A/B testing strategies
* scalability across multiple brands

---

## 🗣️ Pair Programming Mindset

This challenge is designed to be solved collaboratively.

During pair programming, the focus should be on:

* asking the right questions,
* explaining decisions clearly,
* iterating together,
* keeping the solution simple and maintainable.

---

## 📝 Notes

This repository is **not a production-ready app**.
It is a **training and evaluation exercise** focused on:

* reasoning,
* architecture,
* communication,
* and real-world decision making.