import random

from html2image import Html2Image

hti = Html2Image()
hti = Html2Image(output_path='/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/my_screenshot_folder')
ranstr = str(random.randrange(1,1000000000))
hti.screenshot(url='https://elvebakken.vgs.no/', save_as='python_org' + ranstr + ".png")