import random
import time
import os
from PIL import Image
from html2image import Html2Image

#Website path
Url = 'https://mon.ruter.no/departures/59.918991000000005-10.753255000000001'
Output = '/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/my_screenshot_folder'
CustomeSize = False
ImageSize = (20,500)

hti = Html2Image()
hti = Html2Image(output_path=Output)

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
time.sleep(10)
#Delete image
for f in os.listdir(Output):
    os.remove(os.path.join(Output, f))