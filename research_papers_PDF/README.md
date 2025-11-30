# Research Papers (PDF Format)

This directory contains PDF files used as targets for steganographic attack testing in the experiment notebooks.

## Purpose

This folder stores PDF research papers that are used directly by `Experiment.ipynb` for:

- Baseline (unmodified) evaluations
- Steganographic attack injection (creating modified PDFs with hidden text)
- Testing LLM evaluation systems under adversarial conditions

## How PDFs Are Used

The experiment workflow:

1. **Original PDF** is loaded from this directory
2. **Steganographic techniques** embed invisible attack payloads into the PDF
3. **Modified PDFs** are created temporarily in `results/` during testing
4. **LLM models** evaluate both original (baseline) and attacked versions
5. **Results** are saved as CSV files comparing baseline vs. attack scores

## Structure

- PDF files stored in this directory
- PDFs are processed directly by PyMuPDF (no text extraction needed)
- Temporary attacked PDFs are auto-deleted after each test

## Adding Papers

To add a new research paper for testing:

1. Download the paper as a PDF from a publisher or repository
2. Save it in this directory with a descriptive filename (e.g., `transformer_architecture_2024.pdf`)
3. The experiment notebook will automatically detect it

## Current Papers

- `llm_code_understanding.pdf`
  - Source: [ACM Digital Library](https://dl.acm.org/doi/pdf/10.1145/3597503.3639187)
  - Paper: "GILT: An LLM-Based IDE Plugin for Code Understanding"
  - Used in comprehensive experiment runs

## Notes

- PDFs are the **direct input** to the experiment (not converted to text)
- Both RAG mode (chunked) and full-text mode work with these PDFs
- Steganographic modifications are temporary and don't alter the original files
- PDFs are tracked in git for reproducibility
 