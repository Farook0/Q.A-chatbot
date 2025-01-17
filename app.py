from fastapi import FastAPI
from transformers import pipeline

## create a new FASTAPI app instance
app = FastAPI()

# instialize the text generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"message": "Hello World"}

#define a function to handle the get request at '/generate'

@app.get("/generate")

def generate(text: str):
    #use the pipeline to generate text from given input text

    output = pipe(text)

    #return the generated text in jason response
    return {"output":output[0]["generated_text"]}
