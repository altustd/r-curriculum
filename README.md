# R Programming Curriculum

A progressive, hands-on R curriculum that takes you from fundamentals to advanced topics using clear, general examples.

Each script builds on the previous one and includes practical exercises.

## Getting Started (VS Code)

1. Open this folder in VS Code
2. Open the integrated R terminal (`Ctrl + `` ` ``)
3. Restore packages:
   ```r
   renv::restore()

```
r-curriculum/
├── README.md
├── renv/                # Reproducible environment
├── renv.lock
├── .vscode/             # VS Code settings
├── scripts/             # All learning scripts (run in order)
├── data/
│   ├── raw/
│   └── processed/
├── outputs/
│   ├── figures/
│   ├── tables/
│   └── reports/
└── .gitignore
