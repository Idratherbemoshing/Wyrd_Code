# Playing around with WebScraping without api's
#
import requests

# URL of the product page
url = 'https://www.pccasegear.com/products/61114/amd-ryzen-9-7950x3d-processor'

# Fetch the webpage content
response = requests.get(url)
webpage_content = response.text

# Print the webpage content
print(webpage_content)

# You can then manually inspect the output to see if it contains the price information
