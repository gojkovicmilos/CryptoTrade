import datetime
import flask
from flask import Flask
from utils.db_connection import mysql
from flask import request
from flask import session

# Dobavljanje blueprint-ova.
# Svaki blueprint je objekat definisan u odvojenom modulu.
from blueprints.simple_login import simple_login
from blueprints.category_services import category_services
from blueprints.article_services import article_services
from blueprints.user_services import user_services
# Flask aplikacija kojoj je URL za staticke podatke podesen
# na korenski URL.
app = Flask(__name__, static_url_path="")

# Konfigurisanje sesije
# Secret key mora biti postavljen da bi se sesija koristila.
app.secret_key = "NEKI_RANDOM_STRING"

# Konfiguracija za povezivanje na bazu podataka.
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = "root"
app.config["MYSQL_DATABASE_DB"] = "mydb"
app.config["MYSQL_DATABASE_HOST"] = "localhost"

mysql.init_app(app)

# Svaki blueprint se mora registrovati pre upotrebe.
app.register_blueprint(simple_login)
# Prilikom registracije moguce je definisati URL prefix za blueprint.
# Ukoliko je URL prefix definisan onda se servisima pristupa preko
# /prefix/URL_servisa.
app.register_blueprint(category_services, url_prefix="/categories")
app.register_blueprint(article_services, url_prefix="/articles")
app.register_blueprint(user_services, url_prefix="/users")


#Jedna funkcija moze se mapirati na vise URL-ova.
@app.route("/")
@app.route("/index")
@app.route("/index.html")
def home():
    '''Funkcija koja vrsi obradu zahteva.
    
    Svi zahtevi koji pristignu na URL-ove / /index i /index.html bice obradjeni ovom f-jom.
    Rezultat obrade ove funkcije je odgovor koji sadrzi podatke iscitane
    iz datoteke index.html.
    Pristupanje datom URL-u iz browsera za rezultat ce imati prikaz
    stranice izgenerisane na osnovu index.html sablona.
    '''

    return app.send_static_file("index.html")

app.run("0.0.0.0", 80, threaded=True)