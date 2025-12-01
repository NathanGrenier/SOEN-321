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
- [Qwen2.5_3b](https://ollama.com/library/qwen2.5:3b)
- [DeepseekR1_8b](https://ollama.com/library/deepseek-r1:8b)
- [Gemma2_9b](https://ollama.com/library/gemma2:9b)

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

##### Downloading Required Models
After installing Ollama, download all required models and the embedding model:

```bash
# Start Ollama server (required for all operations)
ollama serve

# Download all LLM models used in experiments
ollama pull qwen3:4b
ollama pull qwen2.5:3b
ollama pull deepseek-r1:8b
ollama pull gemma2:9b

# Download embedding model (required for RAG mode)
ollama pull nomic-embed-text
```

> **Note**: Keep the `ollama serve` terminal window open while running experiments.

#### Windows/Linux (Docker)
Follow [this guide](https://docs.ollama.com/docker) to setup Ollama using Docker. Make sure to install the necessary software for your GPU.

##### Starting Ollama and Downloading Models

```bash
# Start Ollama service (runs in background)
docker compose up -d

# Download all required models (only needed once - persists in volume)
docker exec -it ollama ollama pull qwen3:4b
docker exec -it ollama ollama pull qwen2.5:3b
docker exec -it ollama ollama pull deepseek-r1:8b
docker exec -it ollama ollama pull gemma2:9b
docker exec -it ollama ollama pull nomic-embed-text
```

The Ollama service will start automatically with `docker compose up -d`. Models are stored in the `ollama_data` volume and persist across container restarts.

**Useful commands:**
- Restart Ollama: `docker compose restart ollama` (clears loaded model from GPU)
- Stop Ollama: `docker compose down`

##### Useful Commands

- View Loaded Models: `docker exec -it ollama ollama ps`
- View Downloaded Models: `docker exec -it ollama ollama list`
- Check Ollama logs: `docker logs ollama`

## Usage

### Quick Start - Running Your First Experiment

**Complete setup checklist before running experiments:**

1. **Start Ollama**:
   - **macOS**: `ollama serve` (keep terminal open)
   - **Windows/Linux (Docker)**: `docker compose up -d` (runs in background)

2. **Download all required models** (only needed once):
   
   **macOS**:

   ```bash
   ollama pull qwen3:4b
   ollama pull qwen2.5:3b
   ollama pull deepseek-r1:8b
   ollama pull gemma2:9b
   ollama pull nomic-embed-text
   ```
   
   **Windows/Linux (Docker)**:

   ```bash
   docker exec -it ollama ollama pull qwen3:4b
   docker exec -it ollama ollama pull qwen2.5:3b
   docker exec -it ollama ollama pull deepseek-r1:8b
   docker exec -it ollama ollama pull gemma2:9b
   docker exec -it ollama ollama pull nomic-embed-text
   ```

3. **Verify models are downloaded**:
   - **macOS**: `ollama list`
   - **Windows/Linux (Docker)**: `docker exec -it ollama ollama list`
   
   Should show: `qwen3:4b`, `qwen2.5:3b`, `deepseek-r1:8b`, `gemma2:9b`, `nomic-embed-text`

4. **Add at least one PDF research paper**:
   - Place PDF file in `research_papers_PDF/` directory
   - Example: `research_papers_PDF/my_paper.pdf`

5. **Start Jupyter**:

   ```bash
   python3 -m uv run jupyter notebook
   ```

6. **Open and run `notebooks/Experiment.ipynb`**:
   - The notebook will verify Ollama connection and model availability
   - Configure RAG settings
   - Run numeric or categorical evaluation cells
   - Results saved to `results/` directory

7. **Analyze results with `notebooks/analysis.ipynb`**:
   - Automatically detects latest result files
   - Generates statistical summaries and comparisons

### Using Jupyter Notebooks

1. Start Jupyter:
```bash
python3 -m uv run jupyter notebook
```

2. Open `notebooks/Experiment.ipynb`

3. Configure RAG settings (Cell 5 in notebook):
   - **USE_RAG**: `True` for RAG mode (recommended), `False` for full-text
   - **CHUNK_SIZE**: characters per chunk
   - **CHUNK_OVERLAP**: amount of characters to overlap per chunk
   - **NUM_CHUNKS_TO_RETRIEVE**: amount of chunks to retrieve
   - **EMBEDDING_MODEL**: `nomic-embed-text`

4. Run experiment cells:
   - Notebook verifies Ollama connection and models
   - Load research papers from PDF format
   - Apply steganographic injection techniques
   - Test with all 4 LLM models
   - Generate comprehensive CSV results (228 tests per paper)

5.  Open `notebooks/analysis.ipynb`

6. Run the cells to:
   - Analyze selected or most recent results
   - Produce csv analysis files

### Adding Research Papers

1. Obtain research paper in PDF format
2. Save it in the `research_papers_PDF/` directory
3. The experiment notebook will automatically detect and process it

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