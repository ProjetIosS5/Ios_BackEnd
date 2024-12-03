import random   
import string
  
def generate_random_phone_number():
    first_part = random.randint(100, 999)
    second_part = random.randint(100, 999)
    third_part = random.randint(1000, 9999)
    phone_number = f"{first_part}-{second_part}-{third_part}"
    
    return phone_number

def generate_random_email(domain_list=None, length=10):
    if domain_list is None:
        domain_list = ['gmail.com', 'yahoo.com', 'hotmail.com']
        
    username = ''.join(random.choices(string.ascii_letters + string.digits, k=length))
    domain = random.choice(domain_list)
    
    return f"{username}@{domain}"
    
def generate_comfirmation_code():
    code = str(random.randint(100000, 999999))
    return code

def send_sms(number, code):
    # Simule l'envoi d'un SMS avec un code
    print(f"Envoi du code {code} au numéro {number}")

def send_email(email, code):
    # Simule l'envoi d'un mail avec un code
    print(f"Envoi du code {code} au mail {email}")