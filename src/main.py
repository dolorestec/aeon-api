
from fastapi import FastAPI

app = FastAPI()


@app.get('/')
async def root():
    return {'message': 'Hello World'}

@app.post('/')
async def health():
    return {'message': 'health'}
