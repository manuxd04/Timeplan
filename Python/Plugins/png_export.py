#Imports
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw
import math

#Generate Image
def MakeTextBox(draw, ImagePos, FontSizeW, FontSizeH):
    Width = 5
    #Top Line
    draw.line((ImagePos[0], ImagePos[1], ImagePos[0] + FontSizeW, ImagePos[1]), width = Width)
    #Left Line
    draw.line((ImagePos[0], ImagePos[1], ImagePos[0], ImagePos[1] + FontSizeH), width = Width)
    #Bottom Line
    draw.line((ImagePos[0], ImagePos[1] + FontSizeH, ImagePos[0] + FontSizeW, ImagePos[1] + FontSizeH), width = Width)
    #Right Line
    draw.line((ImagePos[0] + FontSizeW, ImagePos[1], ImagePos[0] + FontSizeW, ImagePos[1] + FontSizeH), width = Width)
def ExportImage(CanvazSize, DisplayText, TextColor):
    #Display Values
    MaxFontSize = math.floor(CanvazSize[0] / 5)

    #Image file generation
    img = Image.new('RGB', (CanvazSize[0], CanvazSize[1]), color = 'red')
    draw = ImageDraw.Draw(img)
    #Text
    font = ImageFont.truetype(r"/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/CHELON.ttf", 50)
    FontSizeW, FontSizeH = draw.textsize(DisplayText, font=font)
    ImagePos = [290,200]
    #ImagePos = [(CanvazSize[0]-FontSizeW)/2, 20]
    draw.text((ImagePos[0],ImagePos[1]), DisplayText, font=font, fill = TextColor)
    
    #Image
    MakeTextBox(draw, ImagePos, FontSizeW, FontSizeH)
    #Saving
    img.show()

#Display Conf
#            W    H
CanvazSize = [690,420]
DisplayText = "Hello World!"
TextColor = (0,200,0)
ExportImage(CanvazSize, DisplayText, TextColor)
