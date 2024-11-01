
from httpx import AsyncClient
import pytest

from src.main import app


@pytest.mark.asyncio
async def test_main():
    async with AsyncClient(app=app, base_url='http://0.0.0.0') as client:
        response = await client.get('/')
        assert response.status_code == 200
        assert response.json() == {'message': 'Hello World'}
