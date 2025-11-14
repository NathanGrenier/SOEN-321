# SOEN-321: LLM Adversarial Steganography Research

Repository for the Information Systems Security (SOEN 321) semester project at Concordia University.

This project focuses on testing LLM AI adversarial steganographic attack prompts on research papers.

## Project Overview

This repository provides tools and notebooks for researching adversarial steganographic attacks on Large Language Models (LLMs). The project includes:

- Jupyter notebooks for interactive experimentation and analysis
- Sample research papers for testing
- Support for multiple open weight LLM providers (ex: Qwen, DeepSeek, Gemma)

### Models

- [Qwen3_4b](https://ollama.com/library/qwen3:4b)
- [DeepseekR1_8b](https://ollama.com/library/deepseek-r1:8b)
- [Gemma3_4b](https://ollama.com/library/gemma3:4b)

## Setup
### Prerequisites

- Python 3.12 or higher
- [uv](https://github.com/astral-sh/uv) package manager
- Ollama

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

### Setting Up Ollama
Head to the download page get the version appropriate for your OS.
[Ollama](https://ollama.com/download)

#### MacOS
Download and install Ollama for Mac using [this link](https://ollama.com/download/mac).

A more in depth requirements page can be found on [Ollama MacOS Docs](https://docs.ollama.com/macos).

##### Running a Model
After running the executable you should be able to start Ollama and download a model.

```bash
# Installing qwen2.5:3b with Ollama
ollama pull qwen2.5:3b
```

#### Windows/Linux (Docker)
Follow [this guide](https://docs.ollama.com/docker) to setup Ollama using Docker. Make sure to install the necessary software for your GPU.

##### Running a Model
Simply use Docker Compose to start the Ollama service: `docker compose up -d`

You can use the following command to restart the Ollama docker container: `docker compose restart ollama`
> Note: This will clear the loaded model from your GPU

##### Useful Commands

- View Loaded Models: `docker exec -it ollama ollama ps`
- View Downloaded Models: `docker exec -it ollama ollama list`

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