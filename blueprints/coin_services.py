import flask
# Dobavljanje klase blueprint iz flask modula.
from flask import Blueprint
from utils.db_connection import mysql

coin_services = Blueprint("coin_services", __name__)

@coin_services.route("/", methods=["GET"])
def coins():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM coin")
    rows = cursor.fetchall()


    return flask.jsonify(rows)

@coin_services.route("/<int:coin_id>", methods=["GET"])
def coin(coin_id):
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM coin WHERE coin.id=%s", coin_id)
    row = cursor.fetchone()

    return flask.jsonify(row)
