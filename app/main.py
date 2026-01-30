from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/version")
def version():
    return {
        "version": os.getenv("APP_Version", "dev"),
        "environment": os.getenv("ENVIRONMENT", "dev")
    }