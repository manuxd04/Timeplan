#https://pypi.org/project/html2image/
import random
import time
import os
from PIL import Image
from html2image import Html2Image
from math import fabs, trunc

#Settings
##Website path
Url = 'https://mon.ruter.no/departures/59.918991000000005-10.753255000000001'
Output = '/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/my_screenshot_folder'
CustomeSize = False
LoadTime = False
ImageSize = (20,500)
WebsiteLoadTime = 1000

#Flags
if LoadTime == False:
    hti = Html2Image(
        output_path=Output,
        custom_flags=['--hide-scrollbars']
    )
else:
    hti = Html2Image(
        output_path=Output,
        custom_flags=['--virtual-time-budget=' + str(WebsiteLoadTime), '--hide-scrollbars']
    )

ranstr = str(random.randrange(1,1000000000))
filename = 'python_org' + ranstr + ".png"
if CustomeSize == True:
    hti.screenshot(url=Url, save_as=filename, size=(20, 500))
else:
    hti.screenshot(url=Url, save_as=filename)
#Open image
dir = Output + "/" + filename
img = Image.open(open(dir, 'rb'))
img.show()
print(dir)
time.sleep(WebsiteLoadTime / 100)
#Delete image
for f in os.listdir(Output):
    os.remove(os.path.join(Output, f))