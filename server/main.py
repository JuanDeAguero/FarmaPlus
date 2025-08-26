from fastapi import FastAPI, HTTPException
import csv
from openai import OpenAI

app = FastAPI()

inventory = {}
with open("inventory.csv", mode="r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        inventory[row["product_id"]] = {
            "product_name": row["product_name"],
            "category": row["category"],
            "price": float(row["price"]),
            "stock_quantity": int(row["stock_quantity"]),
            "description": row["description"],
        }

@app.get("/health")
def health_check():
    return {"status": "ok"}

@app.get("/product/{product_id}")
def get_product(product_id: int):
    product = inventory.get(str(product_id))
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product

@app.post("/chat")
def chat(message: str):
    api_key = ""
    base_url = "https://api.deepseek.com"

    client = OpenAI(api_key=api_key, base_url=base_url)

    try:
        response = client.chat.completions.create(
            model="deepseek-chat",
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": message},
            ],
            stream=False
        )
        return {"response": response.choices[0].message.content}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error communicating with DeepSeek: {str(e)}")