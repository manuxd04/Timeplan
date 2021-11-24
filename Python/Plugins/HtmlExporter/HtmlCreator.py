import glob
import os
import sys
import json
from typing import Type
import dominate
from dominate import document
from dominate.tags import *
from bs4 import BeautifulSoup as bs

# Paths
UsingWin = True

if UsingWin == False:
    JsonPath = r"/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/HtmlExporter/json-example/example.json"
    SavePath = r"/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/HtmlExporter/Export"
elif UsingWin == True:
    JsonPath = r"D:\Johannes\Desktop\Git\Python-Kalender\Timeplan\Python\Plugins\HtmlExporter\json-example\example.json"
    SavePath = r"D:\Johannes\Desktop\Git\Python-Kalender\Timeplan\Python\Plugins\HtmlExporter\Export"
# Html Methods
NxClm = """
"""

print("Json -> html exportering til " + SavePath + " Startet")
def GetStrFromKey(key, value):
    #print(key, value)
    PropStr = ""
    if key == "color":
        Page_Color = f"({value[0]}, {value[1]}, {value[2]}, {value[3] / 255})"
        PropStr = NxClm + PropStr + "background-color" + ": rgba" + Page_Color + ";"
    elif key == "width":
        for key1, value in value.items():
            PropStr = PropStr + NxClm + key1 + ": " + str(value) + ";"
    elif key == "top" or key == "bottom" or key == "left" or key == "right":
        PropStr = PropStr + NxClm + key + ": " + str(value) + ";"
    # print(PropStr)
    elif key == "offset":
        PropStr = (
            PropStr + NxClm + key + ": " + str(value[0]) + "px " + str(value[1]) + "px;"
        )
    elif key == "radius":
        for key1, value in value.items():
            if key1 == "top_left":
                PropStr = (
                    PropStr + NxClm + "border-top-left-radius" + ": " + str(value) + ";"
                )
            elif key1 == "top_right":
                PropStr = (
                    PropStr
                    + NxClm
                    + "border-top-right-radius"
                    + ": "
                    + str(value)
                    + ";"
                )
            elif key1 == "bottom_left":
                PropStr = (
                    PropStr
                    + NxClm
                    + "border-bottom-left-radius"
                    + ": "
                    + str(value)
                    + ";"
                )
            elif key1 == "bottom_right":
                PropStr = (
                    PropStr
                    + NxClm
                    + "border-bottom-right-radius"
                    + ": "
                    + str(value)
                    + ";"
                )
    elif key == "size":
        PropStr = PropStr + NxClm + "size" + ": " + str(value) + ";"
    else:
        # PropStr = NxClm + "UnknownVal : Unknown;"
        PropStr = ""
    return PropStr


def CreatePropertyStr(Properties):
    PropStr = """"""
    if type(Properties) == dict:
        for key, value in Properties.items():
            PropStr = PropStr + GetStrFromKey(key, value) + NxClm
    return PropStr


def CreateStyle(Dict, Format, OptionalName):
    Styles = {}
    for StyleName, StyleVals in Dict.items():
        if type(StyleVals) == dict:
            # print(StyleName, StyleVals)
            Style = ""
            if OptionalName:
                Style = OptionalName + "{"
            else:
                Style = StyleName + "{"
            for PropName, PropVal in StyleVals.items():
                Style = Style + GetStrFromKey(PropName, PropVal)
            Style = Style + NxClm + "}"
            # print(Style)
            Styles[StyleName] = Style
    #print("-------")
    if Format == "Str":
        String = ""
        for StyleName, StyleVals in Styles.items():
            result = str(StyleVals)
            String = String + result + NxClm
        return String
        # return Styles
    elif Format == "Dict":
        return Styles


# Html initizlise
doc = dominate.document(title="Html_export")

# Fill out html
with open(JsonPath, "r") as f:
    # Json
    Json = json.load(f)
    # print(Json["canvas"])
    # Header
    Canvas_Size = [Json["canvas"]["size"][0], Json["canvas"]["size"][1]]
    # BodyColor = CreatePropertyStr({"color" : Json["canvas"]["style"]["color"]})
    # print("-------")
    # Styles = CreateStyle(Json["canvas"]["style"], "Str")
    with doc.head:
        link(rel="stylesheet", href="../Css/style.css")
        for x in Json["cards"]:
            CardStyles = CreateStyle(x, "Str", "[id='" + str(x["id"]) + "']")
            #print(x["id"], CardStyles)
            style("""\
                """ + CardStyles + """
            """)
        # Style
        # Body
        # style("""\
        # body{
        #    height: """ + str(Canvas_Size[0]) + """px;
        #    width: """ + str(Canvas_Size[1]) + """px;
        #    """ + BodyColor + """
        #    }
        # """ + Styles + """
        # """ + CardStyles + """
        # """)
    # Body
    with doc.body:
        # Title
        #Creds
        p("JSON - HTML/CSS CONVERTERER").set_attribute("class", "announcement")
        p("Credits : Johannes").set_attribute("class", "announcement")
        p("Timeplan").set_attribute("class", "Title")
        # Table = h1('Tabell').set_attribute('class','Page_Title')
        # KalenderBox
        # div().set_attribute("class", "Kalender_Container")
        # Create boxes
        CalenderContainer = div()
        CalenderContainer.set_attribute("class", "Kalender_Container")
        with CalenderContainer:
            #Write day calender
            dayInt = 0
            for day in Json["elements"][0]["headers"]["top"]["content"]:
                dayInt += 1
                DayName = day["elements"][0]["text"]

                DivT = div()
                DivT.set_attribute("class", "Wich_Day")
                #Insert text
                with DivT:
                    Txt = p(DayName)
                CardStyle = """\
                    grid-column:""" + str(dayInt) + " / " + str(dayInt + 1) + ";" + """
                    grid-row:""" + "1" + " / " + "2" + ";" + """
                """
                DivT.set_attribute("style", CardStyle)
                #print(DayName)
            #Insert center element
            Spacing = div()
            Spacing.set_attribute("class", "Spacing")
            CardStyle = """\
                grid-column:""" + "1" + " / " + "6" + ";" + """
                grid-row:""" + "2" + " / " + "3" + ";" + """
            """
            Spacing.set_attribute("style", CardStyle)
            #Insert days
            for Element_Card in Json["elements"][0]["grid"]["content"]:
                #Days
                Card_Id = Element_Card["id"]
                Card_Pos = Element_Card["position"]
                Card_Text = ""
                for x in Json["cards"]:
                    if x["id"] == Card_Id:
                        if x["elements"]:
                            Card_Text = x["elements"][0]["text"]
                #print(Card_Id, Card_Pos)
                DivT = div()
                DivT.set_attribute("id", Card_Id)
                DivT.set_attribute("class", "Card")
                #Insert text
                with DivT:
                    if Card_Text != "":
                        Txt = p(Card_Text)
                    else:
                        Txt = p("_")
                # Card style

                #Get card pos Str
                Card_Pos_X = 0
                Card_Pos_Y = 0

                Card_Pos_X = str(Card_Pos[1] + 1)
                Card_Pos_Y = str(Card_Pos[0] + 3)

                CardStyle = """\
                    grid-column:""" + Card_Pos_X + " / " + str(int(Card_Pos_X) + 1) + ";" + """
                    grid-row:""" + Card_Pos_Y + " / " + str(int(Card_Pos_Y) + 1) + ";" + """
                """
                DivT.set_attribute("style", CardStyle)
# Export
FilePath = SavePath + "/index.html"
# Format
# print(bs(doc, 'html.parser').prettify())
# print(bs(html_string, 'html.parser').prettify())
# root = lh.tostring(sliderRoot) #convert the generated HTML to a string
# soup = bs(root)                #make BeautifulSoup
# prettyHTML = soup.prettify()   #prettify the html
# Save
prettified = ""
with open(FilePath, "w") as f:
    f.write(doc.render())
with open(FilePath, "r") as f:
    html = f.read()
    prettified = bs(html, "html.parser").prettify()
with open(FilePath, "w") as f:
    f.write(prettified)
print("Json -> html exportering til " + SavePath + " velykket")