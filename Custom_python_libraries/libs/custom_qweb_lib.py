from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
import datetime
QWEB = BuiltIn().get_library_instance('QWeb')


def type_and_log(locator, data):
    lista = data.split(",")
    for x in lista:
        QWEB.type_text(locator, x)
        logger.warn(x+', Syöte *vuorossa olevan syöte* annettu')
  

def type_date(locator):
    x = datetime.datetime.now()
    date = x.strftime("%w.%m.%Y")
    QWEB.type_text(locator, date)

def type_date_enc(locator, num=0):
    x = datetime.datetime.now()
    day = x.strftime("%w")
    day = int(day) + num
    date = x.strftime(str(day)+".%m.%Y")
    QWEB.type_text(locator, date)
    return date