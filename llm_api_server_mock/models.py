from datetime import datetime
from fastapi import APIRouter

from .chat.surrogates import available_surrogates

router = APIRouter(prefix="/models")

@router.get("/")
def models():
    return {
    "object": "list",
        "data": [
            {
                "id": surrogate.name,
                "object": "model",
                "created": int(datetime.now().timestamp()),
                "owned_by": "organization-owner"
            }
            for surrogate in available_surrogates
        ],
        "object": "list"
    }
