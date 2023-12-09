from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# URL of the Amazon search page
url = 'https://www.amazon.com.au/s?k=amd+ryzen+5+5600x'

# Set up the Chrome WebDriver
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

# Open the webpage
driver.get(url)

# Wait for the page to load (adjust the time as needed)
time.sleep(5)

# Get the page source
page_source = driver.page_source

# Print the page source
print(page_source)

# Close the browser
driver.quit()
