# SOEN-321: LLM Adversarial Steganography Research

Repository for the Information Systems Security (SOEN 321) semester project at Concordia University.

This project focuses on testing LLM AI adversarial steganographic attack prompts on research papers.

## Project Overview

This repository provides tools and notebooks for researching adversarial steganographic attacks on Large Language Models (LLMs). The project includes:

- Jupyter notebooks for interactive experimentation and analysis
- Sample research papers for testing
- Support for multiple LLM providers (Google, )

## Setup

This repository now includes:

### Python Project with `uv` Package Manager
- **pyproject.toml**: Project configuration with dependencies
- **uv package manager**: Fast, modern Python package manager
- **Python 3.12**: Latest stable Python version

### Prerequisites

- Python 3.12 or higher
- [uv](https://github.com/astral-sh/uv) package manager

### Installation

1. Clone the repository:
```bash
git clone https://github.com/NathanGrenier/SOEN-321.git
cd SOEN-321
```

2. Install dependencies using uv:
```bash
python3 -m uv sync --all-extras
```

3. Configure API keys:
```bash
cp .env.example .env
# Edit .env and add your API keys
```

3. Run the Jupyter Notebook

### API Keys

You'll need API keys from one or more LLM providers:

- **Gemini**: Get your key at https://aistudio.google.com/api-keys

Add these keys to your `.env` file.

## Usage

### Using Jupyter Notebooks

1. Start Jupyter:
```bash
python3 -m uv run jupyter notebook
```

2. Open `notebooks/steganography_testing.ipynb`

3. Run the cells to:
   - Load research papers
   - Create steganographic prompts
   - Test with different LLM APIs
   - Analyze results

### Adding Research Papers

1. Convert your research paper to plain text
2. Save it in the `research_papers/` directory
3. Use it in your scripts or notebooks

## Development

### Adding New Dependencies

```bash
# Add a new package
python3 -m uv add package-name

# Add a dev dependency
python3 -m uv add --dev package-name
```

### Running Code

```bash
# Run with uv (uses .venv automatically)
python3 -m uv run python script.py

# Or activate venv manually
source .venv/bin/activate
python script.py
```

### Updating Dependencies

```bash
# Update all dependencies
python3 -m uv sync --upgrade

# Update specific package
python3 -m uv add --upgrade package-name
```

### Code Style

The project follows standard Python conventions. Format code using:

```bash
python3 -m uv run black .
```

This will format all Python files (`.py`) and Jupyter Notebooks (`.ipynb`) in the project.

## Troubleshooting

### Issue: API Key Not Found

```bash
# Make sure .env exists and has keys
cat .env

# Should show:
# OPENAI_API_KEY=sk-...
```

### Issue: Dependencies Not Installing

```bash
# Try reinstalling uv
python3 -m pip install --upgrade uv

# Clear cache and reinstall
rm -rf .venv/
python3 -m uv sync
```

### Issue: Jupyter Not Starting

```bash
# Make sure ipykernel is installed
python3 -m uv run python -m ipykernel --version

# Reinstall if needed
python3 -m uv add jupyter ipykernel
```
