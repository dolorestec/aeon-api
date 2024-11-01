# -*- coding: utf-8 -*-
from typing import AsyncGenerator
from fastapi.testclient import TestClient
from httpx import ASGITransport, AsyncClient
import pytest

from src.main import app


@pytest.fixture
async def client() -> AsyncGenerator[TestClient, None]:

    async with AsyncClient(transport=ASGITransport(app=app), base_url='http://0.0.0.0') as client:
        yield client
