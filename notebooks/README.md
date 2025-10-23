# Notebooks Directory

This directory contains Jupyter notebooks for interactive experimentation with LLM adversarial steganographic attacks.

## Available Notebooks

### `steganography_testing.ipynb`
Main notebook for testing steganographic attacks on research papers.

**Features:**
- Load and process research papers
- Create various types of steganographic prompts
- Test with multiple LLM APIs (OpenAI, Anthropic)
- Batch testing capabilities
- Result analysis and comparison

**Usage:**
```bash
# Start Jupyter
python3 -m uv run jupyter notebook

# Or use JupyterLab
python3 -m uv run jupyter lab
```

## Creating New Notebooks

To create a new notebook:

1. Start Jupyter: `python3 -m uv run jupyter notebook`
2. Click "New" → "Python 3"
3. Save with a descriptive name
4. Import required libraries:
   ```python
   from pathlib import Path
   from dotenv import load_dotenv
   import os
   
   load_dotenv()  # Load API keys
   ```

## Notebook Best Practices

1. **Load Environment Variables**: Always load `.env` at the start
2. **Document Your Work**: Use markdown cells to explain your approach
3. **Save Results**: Export findings for later analysis
4. **Clear Outputs**: Clear outputs before committing to keep repo clean

## Tips

- Use `Shift+Enter` to run cells
- Use `Esc` then `A` to insert cell above
- Use `Esc` then `B` to insert cell below
- Use `Esc` then `DD` to delete a cell
- Use `Ctrl+S` to save

## Common Tasks

### Load a Research Paper
```python
def load_paper(filename):
    paper_path = Path("..") / "research_papers" / filename
    with open(paper_path, 'r') as f:
        return f.read()

paper = load_paper("sample_paper.txt")
```

### Test with OpenAI
```python
from openai import OpenAI
client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

response = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "user", "content": prompt}
    ]
)
print(response.choices[0].message.content)
```

### Test with Anthropic
```python
from anthropic import Anthropic
client = Anthropic(api_key=os.getenv('ANTHROPIC_API_KEY'))

response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=500,
    messages=[
        {"role": "user", "content": prompt}
    ]
)
print(response.content[0].text)
```
