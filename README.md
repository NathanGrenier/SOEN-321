# SOEN-321: LLM Adversarial Steganography Research

Repository for the Information Systems Security (SOEN 321) semester project at Concordia University.

This project focuses on testing LLM AI adversarial steganographic attack prompts on research papers.

## Project Overview

This repository provides tools and notebooks for researching adversarial steganographic attacks on Large Language Models (LLMs). The project includes:

- Python scripts for testing LLM APIs with steganographic prompts
- Jupyter notebooks for interactive experimentation
- Sample research papers for testing
- Support for multiple LLM providers (OpenAI, Anthropic)

## Setup

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
python3 -m uv sync
```

3. Configure API keys:
```bash
cp .env.example .env
# Edit .env and add your API keys
```

### API Keys

You'll need API keys from one or more LLM providers:

- **OpenAI**: Get your key at https://platform.openai.com/api-keys
- **Anthropic**: Get your key at https://console.anthropic.com/settings/keys

Add these keys to your `.env` file.

## Project Structure

```
SOEN-321/
├── research_papers/       # Research paper documents (text files)
│   ├── sample_paper.txt  # Example research paper
│   └── README.md         # Documentation for papers directory
├── scripts/              # Python scripts for testing
│   └── test_llm_steganography.py  # Main testing script
├── notebooks/            # Jupyter notebooks for analysis
│   └── steganography_testing.ipynb  # Interactive testing notebook
├── .env.example         # Template for environment variables
├── .gitignore          # Git ignore rules
├── pyproject.toml      # Project dependencies
└── README.md           # This file
```

## Usage

### Using Python Scripts

Run the test script to analyze research papers with steganographic prompts:

```bash
python3 -m uv run scripts/test_llm_steganography.py
```

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

## Research Focus

This project explores:

- **Adversarial Steganography**: Hiding malicious instructions within legitimate prompts
- **Prompt Injection**: Testing various injection techniques on LLMs
- **Security Analysis**: Evaluating LLM robustness against steganographic attacks
- **Research Paper Context**: Using academic papers as cover text for attacks

## Development

### Running Tests

```bash
python3 -m uv run pytest
```

### Adding Dependencies

```bash
python3 -m uv add package-name
```

### Code Style

The project follows standard Python conventions. Format code using:

```bash
python3 -m uv run black .
```

## Contributing

This is an academic project for SOEN 321 at Concordia University. Contributions should align with the course objectives and academic integrity policies.

## License

See the LICENSE file for details.

## Disclaimer

This research is for educational and security research purposes only. Users are responsible for ensuring their use complies with applicable laws, regulations, and the terms of service of any LLM providers.
