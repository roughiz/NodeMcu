#!/usr/bin/env python
import web
import logging
import json
import sys

url = (
    '/commandes/(.*)', 'get_commande'
)

app = web.application(url, globals())



class get_commande:
    def GET(self,commande):
       try:
	     logging.warning(" [x] Commande : "+commande)
       	     return "Merci, votre requete est prise en charge\n"
       except:
          print "Unexpected error:", sys.exc_info()[0]
          raise
if __name__ == "__main__":
    app.run()
