from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import pymysql

app = FastAPI()

# MySQL connection
db = pymysql.connect(
    host="localhost",
    user="Rea",
    password="20201030",
    database="contact_book"
)
cursor = db.cursor()

class Contact(BaseModel):
    contact_id: int = None
    contact_name: str
    contact_email: str
    contact_phone: str = None
    category_id: int = None

# CREATE
@app.post("/contacts/")
def create_contact(contact: Contact):
    cursor.execute(
        "INSERT INTO contacts (contact_name, contact_email, contact_phone, category_id) VALUES (%s, %s, %s, %s)",
        (contact.contact_id, contact.contact_name, contact.contact_email, contact.contact_phone, contact.category_id)
    )
    db.commit()
    return {"message": "Contact created"}

# READ
@app.get("/contacts/")
def get_contacts():
    cursor.execute("SELECT * FROM contacts")
    return cursor.fetchall()

# UPDATE
@app.put("/contacts/{contact_id}")
def update_contact(contact_id: int, contact: Contact):
    cursor.execute(
      "UPDATE contacts SET name=%s, email=%s, phone=%s, category_id=%s WHERE contact_id=%s",
        (contact.name, contact.email, contact.phone, contact.category_id, contact_id)
    )
    db.commit()
    return {"message": "Contact updated"}

# DELETE
@app.delete("/contacts/{contact_id}")
def delete_contact(contact_id: int):
    cursor.execute("DELETE FROM contacts WHERE contact_id=%s", (contact_id,))
    db.commit()
    return {"message": "Contact deleted"}