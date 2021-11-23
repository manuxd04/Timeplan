#Imports
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw
import math
import time
#Image export settings
CanvazSize = [690,420]
#Generate Image
def MakeTextBox(draw, ImagePos, FontSizeW, FontSizeH):
    BoxOffset = 0
    Width = 8
    HalfWidth = (Width / 2)
    OffsetManX = BoxOffset + HalfWidth
    OffsetManY = BoxOffset + HalfWidth
    #Top Line
    draw.line((ImagePos[0] - OffsetManX, ImagePos[1] - OffsetManX, ImagePos[0] + OffsetManX + FontSizeW, ImagePos[1] - OffsetManX), width = Width)
    #Left Line
    draw.line((ImagePos[0] - OffsetManX, ImagePos[1] - OffsetManX - HalfWidth + 1, ImagePos[0] - OffsetManX, ImagePos[1] + OffsetManX + FontSizeH + HalfWidth), width = Width)
    #Bottom Line
    draw.line((ImagePos[0] - OffsetManX, ImagePos[1] + OffsetManX + FontSizeH, ImagePos[0] + OffsetManX + FontSizeW, ImagePos[1] + OffsetManX + FontSizeH), width = Width)
    #Right Line
    draw.line((ImagePos[0] + OffsetManX + FontSizeW, ImagePos[1] - OffsetManX - HalfWidth + 1, ImagePos[0] + OffsetManX + FontSizeW, ImagePos[1] + OffsetManX + FontSizeH + HalfWidth), width = Width)
    #draw.line((ImagePos[0] + FontSizeW, ImagePos[1] - HalfWidth, ImagePos[0] + FontSizeW, ImagePos[1] + FontSizeH + HalfWidth), width = Width)
def AddText(Img, CanvazSize, DisplayText, TextColor, ImagePos, FontSize):
    #Display Values
    MaxFontSize = math.floor(CanvazSize[0] / 5)

    #Text
    font = ImageFont.truetype(r"/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/CHELON.ttf", FontSize)
    FontSizeW, FontSizeH = Img.textsize(DisplayText, font=font)
    #ImagePos = [(CanvazSize[0]-FontSizeW)/2, 20]
    Img.text((ImagePos[0],ImagePos[1]), DisplayText, font=font, fill = TextColor)
    
    #Image
    MakeTextBox(Img, ImagePos, FontSizeW, FontSizeH)
    #Saving
def CreateCanvas():
    global CanvazSize
    img = Image.new('RGB', (CanvazSize[0], CanvazSize[1]), color = 'black')
    draw = ImageDraw.Draw(img)
    return draw, img

#Display Conf
#            W    H
Img, File = CreateCanvas()
Pos = [20,50]
DisplayText = "Manda"
TextColor = (0,200,0)
AddText(Img, CanvazSize, DisplayText, TextColor, Pos, 50)
for x in range(2,10):
    Pos = [20,50 * x]
    DisplayText = "Hello World!"
    TextColor = (0,200,0)
    AddText(Img, CanvazSize, DisplayText, TextColor, Pos, 50)
File.show()