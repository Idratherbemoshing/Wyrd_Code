import requests
from bs4 import BeautifulSoup

# Function to fetch the price of a PC part
def fetch_price(url):
    # Sending a quest to the distant lands (website)
    response = requests.get(url)
    # Parsing the HTML content
    soup = BeautifulSoup(response.text, 'html.parser')

    # Finding the price element
    # Note: You need to replace 'price_element' with the actual element identifier
    price = soup.find('span', {'id': 'price_element'}).text

    return price

# URL of the PC part - replace with the actual product page
product_url = 'http://something.com/pc-part'

# fetch the current price
current_price = fetch_price(product_url)
print(f"The current price of the chosen PC part is: {current_price}")

# Here you can add logic to compare prices and detect fluctuations
