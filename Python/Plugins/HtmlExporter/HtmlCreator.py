import glob
import os
import dominate
from dominate import document
from dominate.tags import *

SavePath = r"/Users/johannes/Desktop/Python-Kalender-Prosjekt/Timeplan/Python/Plugins/HtmlExporter/Export"
#Doc
doc = dominate.document(title='Html_export')
#Header
with doc.head:
    link(rel='stylesheet', href='../Css/style.css')
#Body
with doc.body:
    #Title
    h1('Tabell').set_attribute('class','Page_Title')
    #KalenderBox
    div().set_attribute("class", "Kalender_Container")
    
#Export
FilePath = SavePath + "/index.html"
with open(FilePath, 'w') as f:
    f.write(doc.render())