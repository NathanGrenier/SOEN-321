# Experiment Notebook - Steganographic Attack Testing

This directory contains the comprehensive experiment notebook for testing steganographic attacks on LLM-based research paper evaluation systems.

## Overview

The **Experiment.ipynb** notebook implements a comprehensive testing framework that:

- Tests **4 steganographic techniques** for embedding invisible text into PDFs
- Evaluates **4 different LLM models** (Qwen, DeepSeek, Gemma)
- Supports both **RAG** (Retrieval-Augmented Generation) and **full-text** evaluation modes
- Implements **7 different attack payloads** designed to manipulate LLM scoring
- Includes **defense mechanisms** (security warnings in prompts)
- Provides both **numerical** (2 aspects × 1-10 scale) and **categorical** (4 aspects × 1-5 scale) evaluation methods

## Prerequisites

Before running the notebook, ensure you have:

### 1. Ollama Server Running

```bash
ollama serve
```

Default: `http://localhost:11434`

The notebook will automatically check the connection on startup.

### 2. Required Models Downloaded

```bash
ollama pull qwen3:4b
ollama pull deepseek-r1:8b
ollama pull gemma2:9b
ollama pull qwen2.5:3b
```

The notebook will verify model availability and warn about missing models.

### 3. Project Structure

SOEN-321/
├── notebooks/
│   └── Experiment.ipynb          # Main experiment notebook
├── research_papers_PDF/           # Place PDF files here
│   └── *.pdf                      # Research papers to evaluate
└── results/                       # Auto-created, stores CSV outputs
    └── comprehensive_*.csv        # Test results

## Experiment Components

### Steganographic Techniques

The notebook implements 4 invisible text injection techniques:

1. **White-on-White**: White text on white background (invisible)
2. **Microscopic**: Extremely small text (0.1pt font size)
3. **Off-Page**: Content positioned outside visible page boundaries
4. **Behind Content**: Text layered beneath existing content

### Attack Payloads

7 different attack strategies designed to manipulate LLM scores:

1. **Subtle**: Natural-sounding praise embedded in text
2. **Format Matching**: Mimics expected output format with high scores
3. **Score Injection**: Embeds explicit scores as "preliminary review"
4. **Comparative Anchoring**: Uses fake citations and inferior paper comparisons to bias evaluation upward
5. **Disguised Instruction**: Hidden as reviewer guidelines
6. **Authority Override**: Claims editorial pre-approval
7. **Aggressive**: Direct commands with threatening language

### Evaluation Methods

#### Categorical Evaluation (4-20 score range)

- **Soundness**: Methodological rigor
- **Novelty**: Originality and innovation
- **Clarity**: Presentation quality
- **Impact**: Potential contribution

**Unified Scale**: All aspects use Poor (1) | Fair (2) | Good (3) | Very Good (4) | Excellent (5)

#### Numeric Evaluation (2-20 score range)

- **Soundness**: 1-10 scale
- **Novelty**: 1-10 scale

### Defense Mechanisms

Both evaluation methods include defense prompts with:

- **Security warnings** about steganography and hidden text
- **Instruction sandwich** method (instruction → content → reminder)
- **Explicit guidance** to ignore embedded instructions

## 🚀 Quick Start

### 1. Open the Notebook

```bash
cd notebooks
jupyter notebook Experiment.ipynb
```

Or use VS Code with Jupyter extension.

### 2. Configure Settings (Cell 5)

```python
# Toggle between RAG and full-text mode
USE_RAG = True  # True for RAG, False for full-text

# RAG Settings (if USE_RAG = True)
CHUNK_SIZE = 1000
CHUNK_OVERLAP = 200
NUM_CHUNKS_TO_RETRIEVE = 40
EMBEDDING_MODEL = 'nomic-embed-text'
```

### 3. Run Tests

**Option A: Numeric Evaluation**

- Run comprehensive numeric test
- Tests all models × papers × techniques × payloads × defense states
- Output: `results/comprehensive_numeric_rag_k40_smart_YYYYMMDD_HHMMSS.csv`

**Option B: Categorical Evaluation**

- Run comprehensive categorical test
- Same test but with categorical scoring
- Output: `results/comprehensive_categorical_rag_k40_smart_YYYYMMDD_HHMMSS.csv`

### 4. Analyze Results

Results are saved as CSV files with columns:

- `paper`: Paper filename
- `model`: LLM model used
- `technique`: Steganographic technique applied
- `payload`: Attack payload type
- `mitigation`: Defense enabled (True/False)
- `soundness`, `novelty` (numeric) or `total_score` (categorical)
- `response`: Full LLM response text

## Expected Outputs

### Test Overview (per evaluation type)

For a single research paper:

- **Models**: 4 (qwen3:4b, deepseek-r1:8b, gemma2:9b, qwen2.5:3b)
- **Test types**: 1 baseline + 4 techniques × 7 payloads × 2 (attack/defense) = **57 tests**
- **Total per model**: 57 tests
- **Total for all models**: 228 tests

### Execution Time

- **Numeric tests**: ~90 minutes (all models, 1 paper)
- **Categorical tests**: ~100 minutes (all models, 1 paper)

Times vary based on model speed and context window usage.

## Key Features

### Automatic Validation

- **Ollama connection check**: Fails early if server not running
- **Model availability check**: Lists missing models to download
- **Path creation**: Auto-creates results directory
- **Error handling**: Tests continue even if individual evaluations fail

### Smart Optimizations

- **Section caching**: Scans PDF once, reuses for all attacks
- **Parallel processing**: Ready for future multi-threading
- **Progress tracking**: ETA calculations and test counters
- **Cleanup**: Automatically removes temporary attacked PDF files

### Robust Parsing

- **JSON-first**: Attempts structured parsing before fallback
- **Typo tolerance**: Handles common field name variations
- **Regex fallback**: 3-tier pattern matching for malformed responses
- **Strict validation**: Only accepts valid categories/scores

## Troubleshooting

### "Cannot connect to Ollama server"

```bash
# Start Ollama in a separate terminal
ollama serve
```

### "Model not available"

```bash
# Pull missing model (example)
ollama pull qwen3:4b
```

### "No PDFs found"

Ensure PDF files are in `../research_papers_PDF/` directory.

### Out of memory errors

- Reduce `NUM_CHUNKS_TO_RETRIEVE` (e.g., 40 → 30)
- Switch to smaller models
- Use RAG mode instead of full-text for large papers

## Notes

- **Full-text mode**: Provides complete paper context to LLM, although not fully tested
- **RAG mode**: Useful for very large documents or limited context windows
- **Defense effectiveness**: Results show if security warnings prevent manipulation
- **Baseline tests**: Essential for measuring attack impact (compare attack vs baseline)
- **CSV format**: Easy to analyze with pandas, Excel, or other data tools

## Related Files

- `../README.md`: Main project documentation
- `../research_papers_PDF/`: Input directory for PDF files
- `../results/`: Output directory for CSV results

---
