#Imports
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw
import math

#Generate Image
def ExportImage(CanvazSize, DisplayText, TextColor):
    #Display Values
    MaxFontSize = math.floor(CanvazSize[0] / 5)
    #Image
    img = Image.new('RGB', (CanvazSize[0], CanvazSize[1]), color = 'red')
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype(r"/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/CHELON.ttf", MaxFontSize)
    w, h = draw.textsize(DisplayText, font=font)
    draw.text(((CanvazSize[0]-w)/2,0), DisplayText, font=font, fill = TextColor)
    draw.text(((CanvazSize[0]-w)/2,h), DisplayText, font=font, fill = TextColor)
    img.show()

#Display Conf
#            W    H
CanvazSize = [1000,920]
DisplayText = "Hello World!"
TextColor = (0,200,0)
ExportImage(CanvazSize, DisplayText, TextColor)
