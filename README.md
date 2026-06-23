# 🎮 Games Using Python — Application Platform

<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License"/>
</p>

<p align="center">
  <strong>A unified cross-platform Flutter + Firebase application that bundles classic casual games (Snake, Block Drop, Sky Hop, Hangman, MineSneeker, Tic Tac Toe, RPS) behind one anonymous-first identity, one cross-game leaderboard, one daily-streak loop, and one ad-light monetization model.</strong>
</p>

---

## 📖 Table of Contents

1. [About the Project](#-about-the-project)
2. [🎮 Game Logic Repository](#-game-logic-repository)
3. [🧰 Tech Stack](#-tech-stack)
4. [🏗️ Architecture Overview](#-architecture-overview)
5. [🚀 Step-by-Step Procedure](#-step-by-step-procedure)
6. [📊 Visual Diagrams](#-visual-diagrams)
7. [🛠️ Installation & Setup](#-installation--setup)
8. [▶️ Running the Project](#-running-the-project)
9. [🧪 Testing Strategy](#-testing-strategy)
10. [👥 Team & Roles](#-team--roles)
11. [🗺️ Project Roadmap](#-project-roadmap)
12. [📚 Companion Documentation](#-companion-documentation)
13. [🤝 Contributing](#-contributing)
14. [📜 License](#-license)
15. [🙏 Acknowledgements](#-acknowledgements)

---

## 📖 About the Project

**Games Platform** is a 14-month, 3-engineer effort to transform a collection of standalone Python game prototypes into a **single, polished, offline-first Android application** powered by **Flutter** and **Firebase**.

The platform's purpose is to give casual mobile gamers (kids, teens, commuters, parents) in India and South-East Asia **one safe, beautifully crafted home** for classic arcade games — without forced logins, without heavy interstitials, and without losing progress on flaky train Wi-Fi.

### ✨ Core Promises

| UVP Claim | Design Promise |
|---|---|
| **One app** | A unified shell with consistent IA across all 6 games |
| **Six games** | Each game gets equal, distinct visual treatment |
| **Zero friction** | Tap-to-play in ≤ 3 taps from cold launch |
| **Offline-first** | Play any game without network; sync in the background |
| **Kid-safe** | No chat, no tracking SDKs, no third-party data harvesters |

### 🎯 Year-1 Targets

- 📥 **1.5M installs**
- 🔁 **22% D7 retention** (~2.75× category median)
- 💵 **~$0.04 ARPDAU**
- 🛡 **99.5% crash-free**
- ⭐ **4.5★ Play Store rating**

---

## 🎮 Game Logic Repository

> **All the underlying game logic (snake, tetris, hangman, minesweeper, RPS, tic-tac-toe, flappy bird, pong) is written in Python and lives in the original repository.**

👉 **Game Logic Source:** [https://github.com/Subhadip-Paul2006/Games-Using-Python](https://github.com/Subhadip-Paul2006/Games-Using-Python)

The Python prototypes serve as the **logic reference layer** for the Flutter ports. Samhita (Design + QA) is responsible for translating each Python implementation into a pure-Dart use-case that the Flutter UI can consume.

---

## 🧰 Tech Stack

### 🧑‍💻 Core Languages & Frameworks

| Layer | Technology | Purpose |
|-------|------------|---------|
| **Game Logic (reference)** | **Python 3.x** | Original prototypes: Snake, Tetris, Hangman, etc. |
| **Application Frontend** | Flutter 3.x | Cross-platform UI (Android / iOS / Web) |
| **Application Language** | Dart 3.x | App + game logic ported from Python |
| **State Management** | Riverpod 2.x (`AsyncNotifier`) | Compile-time DI, async streams |
| **Game Loop** | Flame 1.x | 2D game engine for arcade titles |
| **Animations** | Rive, Lottie | Micro-interactions |

### ☁️ Firebase Services (Backend)

| Service | Purpose |
|---------|---------|
| 🔐 **Firebase Authentication** | Anonymous + Email + Google (App Check enforced) |
| 🗄️ **Cloud Firestore** | Profiles, scores, leaderboards, streaks |
| ⚡ **Cloud Functions (Gen 2)** | Score validation, leaderboard rollup, IAP verify |
| 📁 **Firebase Storage** | Avatars, replay files (v1.1) |
| 📲 **Cloud Messaging (FCM)** | 6 PM streak reminder, new-game notification |
| 📊 **Firebase Analytics** | Funnels + retention |
| 🐞 **Crashlytics** | Crash + non-fatal error reporting |
| 🛡️ **App Check** | Play Integrity attestation (anti-bot) |
| 🧪 **Remote Config** | Feature flags, A/B test variants |
| 🌐 **Firebase Hosting** | Privacy policy + static marketing pages |

### 🛠️ Dev & Ops Tooling

| Tool | Use |
|------|-----|
| **Android Studio / VS Code** | IDE + Flutter plugins |
| **Figma** | UI/UX design system + prototyping |
| **GitHub + GitHub Actions** | Version control + CI/CD |
| **Codemagic / Fastlane** | Release builds, store publishing |
| **Postman** | Cloud Function endpoint testing |
| **Jira / GitHub Projects** | Sprint & task tracking |

---

## 🏗️ Architecture Overview

```mermaid
flowchart TB
    subgraph Python["🐍 Python Layer (Logic Reference)"]
        P1[Snake]
        P2[Block Drop / Tetris]
        P3[Sky Hop / Flappy]
        P4[Hangman]
        P5[MineSneeker]
        P6[RPS]
        P7[Tic Tac Toe]
        P8[Pong]
    end

    subgraph Flutter["📱 Flutter Application (Android / iOS / Web)"]
        UI[Presentation Layer<br/>Widgets + Screens]
        STATE[State Layer<br/>Riverpod / Bloc]
        DOMAIN[Domain Layer<br/>Dart Use-Cases ported from Python]
        DATA[Data Layer<br/>Repositories]
    end

    subgraph Firebase["☁️ Firebase Backend (asia-south1)"]
        AUTH[🔐 Authentication]
        FS[(🗄️ Firestore)]
        FN[⚡ Cloud Functions]
        ST[📁 Storage]
        FCM[📲 FCM]
        AN[📊 Analytics]
        AC[🛡️ App Check]
    end

    Python --> DOMAIN
    UI <--> STATE
    STATE <--> DOMAIN
    DOMAIN <--> DATA
    DATA <--> AUTH
    DATA <--> FS
    DATA <--> ST
    DATA -.-> FN
    DATA -.-> FCM
    UI -.-> AN
    AUTH -.-> AC
```

### Clean Architecture Layers

```text
lib/
├── core/                # constants, themes, utils, routing
├── data/                # Firebase repositories & DTOs
├── domain/              # entities, use-cases (Dart ports of Python)
├── presentation/        # screens, widgets, controllers
│   ├── auth/
│   ├── home/
│   ├── games/
│   │   ├── snake/
│   │   ├── block_drop/
│   │   ├── sky_hop/
│   │   ├── hangman/
│   │   ├── minesneeker/
│   │   ├── rps/
│   │   └── tic_tac_toe/
│   ├── leaderboard/
│   └── profile/
└── main.dart
```

---

## 🚀 Step-by-Step Procedure

This is the **end-to-end workflow** every contributor follows — from cold clone to Play Store submission.

### Step 1 — Clone & Bootstrap the Repo

```bash
# Clone the platform repo
git clone https://github.com/Subhadip-Paul2006/Games-Using-Python-Application.git
cd Games-Using-Python-Application

# Clone the Python game logic reference repo (separate)
git clone https://github.com/Subhadip-Paul2006/Games-Using-Python
```

### Step 2 — Install Toolchain

| Tool | Command |
|------|---------|
| Flutter SDK 3.x | `flutter doctor` |
| Android Studio | Install emulator + SDK 26+ |
| Firebase CLI | `npm install -g firebase-tools` |
| Dart | bundled with Flutter |

### Step 3 — Configure Firebase

```bash
# Login
firebase login

# Add the Firebase project
firebase use --add

# Configure Android app (gets google-services.json)
flutterfire configure
```

### Step 4 — Install Dependencies

```bash
flutter pub get
```

### Step 5 — Port Python Logic → Dart Use-Cases

For each Python game (e.g., `Snake Game/snake.py`):

1. Read the Python source to extract the pure logic.
2. Write an equivalent Dart class in `lib/domain/games/<game>/`.
3. Cover with unit tests (`test/domain/games/<game>/`).
4. Wrap the Dart logic in a Flame component for arcade titles, or plain widgets for board games.

### Step 6 — Build the UI Shell

Per-game UI lives in `lib/presentation/games/<game>/`:

- HUD (score, pause, level)
- Pause / Game-Over overlays
- Settings drawer
- Tutorial overlay

### Step 7 — Wire the Platform Layer

Each game implements the `GameModule` abstract class so the platform can:

- Submit scores via `ScoreClient` (idempotent + offline-outbox).
- Log analytics events.
- Show the rewarded-ad button at game-over.
- Gate IAP behind the Parent PIN.

### Step 8 — Run on Device / Emulator

```bash
flutter run                    # debug
flutter run --release          # release build
flutter run -d chrome          # web (v1.1)
```

### Step 9 — Test

```bash
flutter test                   # unit + widget
flutter test --coverage        # coverage report
firebase emulators:exec --only firestore "flutter test integration_test/"
```

### Step 10 — Open a Pull Request

1. Branch from `develop`: `git checkout -b feature/<name>`
2. Conventional commits: `feat(snake): add pause overlay`
3. Open PR, link the issue (`Closes #123`), tag reviewer.
4. CI runs lint + tests + golden tests.
5. Squash-merge to `develop`.

### Step 11 — Release

1. `develop` → manual QA → `main`.
2. Tag `v*` triggers Codemagic release build.
3. Upload signed AAB to Play Console.
4. Staged rollout: 5 % → 20 % → 50 % → 100 %.

---

## 📊 Visual Diagrams

### 1️⃣ End-to-End System Architecture

```mermaid
graph TB
    User([👤 User])
    App[📱 Flutter Android App<br/>Riverpod + Flame]
    AC[🛡️ App Check<br/>Play Integrity]
    Auth[🔐 Firebase Auth]
    FS[(🗄️ Firestore<br/>asia-south1)]
    CF[⚡ Cloud Functions<br/>TypeScript]
    ST[📁 Cloud Storage]
    FCM[📲 FCM]
    AN[📊 Analytics]
    CR[🐞 Crashlytics]
    AdMob[💰 AdMob Rewarded]
    Play[🛒 Play Billing IAP]

    User --> App
    App --> AC
    AC --> Auth
    App --> Auth
    Auth --> FS
    App --> FS
    FS --> CF
    App --> ST
    CF --> FCM
    App --> AN
    App --> CR
    App --> AdMob
    App --> Play
```

### 2️⃣ User Journey — From Install to Day-7 Streak

```mermaid
journey
    title User Journey — Cold Install to Retention Loop
    section Discovery
      See Play Store ad           : 4: Aarav
      Tap Install                  : 5: Aarav
    section Onboarding
      Pick language                : 4: Priya
      Anonymous profile auto-created : 4: System
    section First Play
      Tap Snake                    : 5: Riya
      Die at score 12              : 3: Riya
      See Game-Over screen         : 4: Riya
    section Retention Loop
      Day 1: Play 3 games          : 4: Priya
      Day 2: 6 PM streak reminder  : 5: Riya
      Day 3: Try Block Drop        : 4: Aarav
      Day 7: 2× XP bonus           : 5: Riya
    section Conversion
      Day 14: See "Remove Ads"     : 3: Mr. Banerjee
      Day 30: Buy "Remove Ads" IAP : 5: Mr. Banerjee
```

### 3️⃣ Offline-First Score Submission Flow

```mermaid
sequenceDiagram
    autonumber
    participant U as 👤 User
    participant W as 📱 Widget
    participant R as 🧠 Riverpod
    participant H as 💾 Hive (local)
    participant CF as ☁️ Cloud Function
    participant FS as 🗄️ Firestore
    participant AN as 📊 Analytics

    U->>W: Tap "Submit Score"
    W->>R: ref.read(submitScoreProvider)
    R->>H: outbox.enqueue(submission)
    H-->>R: persisted locally
    R-->>W: optimistic UI updates
    par Background Sync
        H->>CF: invoke submitScore (HTTPS)
        CF->>FS: write score + PB transaction
        FS-->>CF: ok
        CF->>AN: emit game_over event
        CF-->>H: outbox.markDone
    end
```

### 4️⃣ Anonymous → Google Sign-In Upgrade

```mermaid
sequenceDiagram
    autonumber
    participant U as 👤 User
    participant App as 📱 Flutter App
    participant AC as 🛡️ App Check
    participant FA as 🔐 Firebase Auth
    participant FS as 🗄️ Firestore
    participant CF as ⚡ Cloud Function

    U->>App: Tap "Sign in with Google"
    App->>AC: Acquire App Check token
    AC-->>App: appCheckToken
    App->>FA: credentialFromGoogle(account)
    FA->>FA: linkWithCredential(googleCred)
    FA-->>App: User (no longer anonymous)
    App->>FS: users/{uid}.set({handle, ...})
    App->>CF: linkAnonymousToProvider({oldAnonUid})
    CF->>FS: Migrate anon scores + PB to newUid
    CF-->>App: {migratedCounts: {scores: 42, pbs: 6}}
    App->>U: "Welcome! Your scores are safe."
```

### 5️⃣ Firestore Data Model (ER Diagram)

```mermaid
erDiagram
    USER ||--o{ SCORE : submits
    USER ||--|| PERSONAL_BEST : has
    USER ||--o{ STREAK_DAY : has
    USER ||--|| ENTITLEMENT : holds
    GAME ||--o{ SCORE : receives
    GAME ||--o{ LEADERBOARD_ENTRY : ranks
    USER ||--o{ LEADERBOARD_ENTRY : appears_as

    USER {
        string uid PK
        string handle
        string country
        string locale
        int current_streak
        int longest_streak
    }
    SCORE {
        string submission_id PK
        string game_id FK
        int value
        timestamp played_at
    }
    PERSONAL_BEST {
        string game_id PK
        int value
        timestamp updated_at
    }
    STREAK_DAY {
        string date PK
        bool completed
    }
    ENTITLEMENT {
        string id PK
        bool active
    }
    GAME {
        string id PK
        string display_name
        bool enabled
    }
    LEADERBOARD_ENTRY {
        string composite_id PK
        string game_id FK
        int rank
        string user_id FK
        int score
    }
```

### 6️⃣ Game Module Contract (Class Diagram)

```mermaid
classDiagram
    class GameModule {
        +GameId id
        +String displayNameKey
        +String iconAsset
        +init() void
        +onPause() void
        +onResume() void
        +onScoreUpdate(int) void
        +onGameOver(int) void
        +dispose() Future~void~
    }
    class SnakeModule
    class BlockDropModule
    class SkyHopModule
    class HangmanModule
    class MineSneekerModule
    class TicTacToeModule

    GameModule <|-- SnakeModule
    GameModule <|-- BlockDropModule
    GameModule <|-- SkyHopModule
    GameModule <|-- HangmanModule
    GameModule <|-- MineSneekerModule
    GameModule <|-- TicTacToeModule
```

### 7️⃣ Phased Development Roadmap (Gantt)

```mermaid
gantt
    title Games Platform — 14-Month Roadmap
    dateFormat  YYYY-MM-DD
    axisFormat  %b %Y

    section Phase 0 — Foundation
    Firebase project + design system     :done,   p0a, 2026-06-20, 30d
    Flutter scaffold + GameModule RFC    :active, p0b, 2026-07-20, 21d

    section Phase 1 — Skeleton
    Auth (anon + email + Google)         :        p1a, 2026-08-10, 21d
    Home + Navigation                    :        p1b, 2026-08-20, 14d

    section Phase 2 — Game Modules
    Snake                                :        p2a, 2026-09-15, 28d
    Block Drop                           :        p2b, 2026-10-10, 21d
    Sky Hop                              :        p2c, 2026-10-25, 21d
    Hangman                              :        p2d, 2026-11-05, 21d
    MineSneeker                          :        p2e, 2026-11-15, 28d
    Tic Tac Toe                          :        p2f, 2026-12-05, 21d

    section Phase 3 — Backend Features
    Leaderboards + Cloud Functions       :        p3a, 2026-10-15, 35d
    Daily streak + push notifications    :        p3b, 2026-11-01, 28d
    Offline sync + Hive cache            :        p3c, 2026-11-15, 35d

    section Phase 4 — Polish
    Localization (HI + BN)               :        p4a, 2027-01-05, 28d
    Accessibility + performance          :        p4b, 2027-01-15, 35d

    section Phase 5 — Release
    Closed beta (500–1000 users)         :        p5a, 2027-02-15, 28d
    Staged rollout (5% → 50%)            :        p5b, 2027-03-15, 14d
    Public launch v1.0                   :crit,   p5c, 2027-04-01, 7d
```

### 8️⃣ Team Workflow (PR + Code Review Loop)

```mermaid
flowchart LR
    A[💡 Idea / Issue] --> B[📝 Sprint Planning<br/>Team Lead]
    B --> C[🛠️ Development<br/>Junior Engineer]
    C --> D[🧪 Self-test<br/>flutter test]
    D --> E[🔍 Code Review<br/>Team Lead]
    E -->|changes requested| C
    E -->|approved| F[🔗 Merge to develop]
    F --> G[📦 CI/CD Pipeline<br/>GitHub Actions]
    G --> H[🚀 Release<br/>Codemagic]
    H --> I[📈 Post-launch<br/>Crashlytics]
```

### 9️⃣ Auth State Machine

```mermaid
stateDiagram-v2
    [*] --> Anonymous: auto-create on launch
    Anonymous --> EmailVerified: sign up / sign in
    Anonymous --> GoogleVerified: sign in with Google
    EmailVerified --> Permanent: link anon → email
    GoogleVerified --> Permanent: link anon → google
    Permanent --> [*]
```

### 🔟 Daily Streak & Notification Loop

```mermaid
stateDiagram-v2
    [*] --> NoStreak
    NoStreak --> Active1: play ≥30s
    Active1 --> Active2: play ≥30s next day
    Active2 --> Active3: play ≥30s next day
    Active3 --> Bonus7: 7-day streak<br/>2× XP reward
    Active7 --> Broken: miss a day
    Broken --> NoStreak: reset counter
    Active7 --> Bonus30: 30-day streak<br/>major reward
    Active7 --> [*]
```

---

## 🛠️ Installation & Setup

### Prerequisites

| Tool | Version | Download |
|------|---------|----------|
| **Git** | latest | https://git-scm.com |
| **Flutter SDK** | 3.x | https://docs.flutter.dev/get-started/install |
| **Android Studio** | latest | https://developer.android.com/studio |
| **VS Code** (optional) | latest | https://code.visualstudio.com |
| **Firebase CLI** | latest | `npm install -g firebase-tools` |
| **JDK** | 17 | https://adoptium.net |
| **Python 3** (only to read the game logic source) | 3.10+ | https://python.org |

### First-Time Setup

```bash
# 1. Verify toolchain
flutter doctor
firebase --version

# 2. Clone the application repo
git clone https://github.com/Subhadip-Paul2006/Games-Using-Python-Application.git
cd Games-Using-Python-Application

# 3. Clone the Python game logic reference (read-only)
git clone https://github.com/Subhadip-Paul2006/Games-Using-Python ../Games-Using-Python

# 4. Get Flutter packages
flutter pub get

# 5. Configure Firebase (ask team lead for project access)
flutterfire configure
```

---

## ▶️ Running the Project

```bash
# Run on a connected Android device or emulator
flutter run

# Run on web (v1.1 — 4 games only)
flutter run -d chrome

# Run in profile mode (for performance profiling)
flutter run --profile

# Build a release APK
flutter build apk --release

# Build an Android App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### Useful Daily Commands

```bash
flutter clean              # clean build artifacts
flutter pub get            # refresh dependencies
flutter analyze            # static analysis (lint)
flutter test               # unit + widget tests
flutter test --coverage    # generate coverage report
dart format lib/ test/     # auto-format Dart code
```

---

## 🧪 Testing Strategy

```mermaid
flowchart LR
    DEV[Local Dev] --> LINT[Dart Analyzer]
    LINT --> UNIT[Unit Tests]
    UNIT --> WIDGET[Widget Tests]
    WIDGET --> GOLDEN[Golden Tests]
    GOLDEN --> INT[Integration Tests]
    INT --> CI{CI: GitHub Actions}
    CI -->|pass| BETA[Closed Beta]
    CI -->|fail| DEV
    BETA --> PROD[Production Release]
```

| Layer | Tooling | Target Coverage |
|-------|---------|----------------|
| **Lint** | `flutter_lints` + custom rules | n/a |
| **Unit** | `flutter_test` + `mocktail` | ≥ 80 % on `domain/` |
| **Widget** | `flutter_test` | ≥ 70 % on `presentation/` |
| **Golden** | `flutter_test` golden files | 1 per screen |
| **Integration** | `integration_test` + Firebase emulators | Smoke for happy path |
| **Firestore Rules** | `@firebase/rules-unit-testing` | 100 % of rules covered |

---

## 👥 Team & Roles

```mermaid
mindmap
  root((Application Team))
    Subhadip Paul
      Team Lead
      Firebase Architecture
      Cloud Functions
      DevOps / CI-CD
      Code Review
    Abhishek
      Flutter Frontend
      UI Implementation
      Animations
      Game UI Integration
    Samhita
      UI/UX Design
      Python → Dart Logic Port
      QA & Testing
      Asset Management
```

| Role | Owner | Responsibilities |
|------|-------|------------------|
| 🧑‍✈️ **Team Lead** | **Subhadip Paul** | Architecture, Firebase, Cloud Functions, CI/CD, Play Store submission, code review |
| 🧑‍💻 **Flutter Engineer** | **Abhishek** | Screens, widgets, navigation, animations, theming, per-game UI shells |
| 🧪 **Design + QA Lead** | **Samhita** | Figma design system, Python→Dart logic ports, QA test plans, localisation |

---

## 🗺️ Project Roadmap

| Phase | Goal | Duration | Status |
|-------|------|----------|--------|
| **Phase 0** — Foundation | Firebase project, design system, GameModule RFC | Jun–Jul 2026 | 🟡 In Progress |
| **Phase 1** — Skeleton | Routing, theming, auth (anon + email + Google) | Aug 2026 | ⏳ Planned |
| **Phase 1.5** — Monetization | AdMob + IAP plumbing | Sep 2026 | ⏳ Planned |
| **Phase 2** — Game Modules | 6 games built on `GameModule` contract | Sep–Dec 2026 | ⏳ Planned |
| **Phase 3** — Backend Features | Leaderboards, streaks, offline sync | Sep–Dec 2026 | ⏳ Planned |
| **Phase 4** — Polish | A11y, localization, performance | Jan–Feb 2027 | ⏳ Planned |
| **Phase 4.5** — Monetization Live | Live AdMob + IAP, A/B infra | Feb 2027 | ⏳ Planned |
| **Phase 5** — Release | Closed beta → staged rollout → global | Feb–Apr 2027 | ⏳ Planned |

**🎯 Public launch target:** 2027-04-01

---

## 📚 Companion Documentation

This application sits on top of three detailed companion docs:

| Doc | Purpose | Audience |
|-----|---------|----------|
| 📄 **[`PRD.md`](./PRD.md)** | Product Requirements — vision, personas, features, KPIs | Product, design, leadership |
| 📄 **[`TRD.md`](./TRD.md)** | Technical Requirements — architecture, APIs, infra, security | Engineers, architects |
| 📄 **[`DESIGN.md`](./DESIGN.md)** | UI/UX specification — components, tokens, screens, a11y | Designers, frontend engineers |
| 📄 **[`APP_DEVELOPMENT.md`](./APP_DEVELOPMENT.md)** | Original scoping doc + team workflow | Everyone |

---

## 🤝 Contributing

We welcome contributions from anyone aligned with the project's principles. Please read the per-phase role tables in [`APP_DEVELOPMENT.md`](./APP_DEVELOPMENT.md) before opening an issue or PR.

### Pull Request Process

1. Branch from `develop`: `<type>/<short-kebab-description>` (e.g., `feature/snake-pause-overlay`)
2. Conventional commits: `feat(snake): add pause overlay`
3. PR must link an issue (`Closes #123`) and follow the PR template.
4. ≥ 1 approval + all CI checks green → squash-merge.
5. Branch auto-deleted on merge.

### Commit Convention

```
feat(snake): add 60 fps swipe input
fix(leaderboard): cap query at 100 docs
docs: update onboarding checklist
chore: bump flutter to 3.24.0
test(snake): add unit tests for collision logic
```

---

## 📜 License

Distributed under the **MIT License**. See [`LICENSE`](./LICENSE) for the full text.

> The Python game logic in the reference repository is also MIT-licensed.

---

## 🙏 Acknowledgements

- **Subhadip Paul** — Project Lead, Backend, Firebase, DevOps
- **Abhishek** — Frontend, Animations, Game UI
- **Samhita** — Design, QA, Python→Dart porting, i18n
- **Python open-source community** — The original game logic prototypes
- **Flutter & Firebase teams** — The platforms that make this possible
- **User testers (n=14)** — Whose feedback shaped the kid-safe, offline-first posture

---

<p align="center">
  <strong>Crafted with 💙 by the Games-Using-Python Application Team</strong><br/>
  <a href="https://github.com/Subhadip-Paul2006">Subhadip Paul</a> · Abhishek · Samhita<br/>
  <sub>Game logic written in Python:</sub><br/>
  <a href="https://github.com/Subhadip-Paul2006/Games-Using-Python">🐍 https://github.com/Subhadip-Paul2006/Games-Using-Python</a>
</p>