from flask import Flask, render_template, jsonify, request
import os


app = Flask(__name__)


@app.route("/prev")
def prev():
	files = os.listdir("static/archive")
	files.sort()
	curr = request.args.get('a', "", type=str).split("/")[-1]

	if curr == "":
		return jsonify(result="static/archive/" + files[-1])
	else:
		i = files.index(curr)
		return jsonify(result="static/archive/" + files[i-1])

@app.route("/next")
def next():
	files = os.listdir("static/archive")
	files.sort()
	curr = request.args.get('a', "latest.mp4", type=str).split("/")[-1]

	if curr == "latest.mp4":
		return jsonify(result="static/archive/" + files[-1])
	else:
		i = files.index(curr)
		return jsonify(result="static/archive/" + files[i+1])

def get_latest():
	files = os.listdir("static/archive")
	files.sort()
	return "static/archive/" + files[-1]

@app.route("/")
def baywatch():
	file = get_latest()
	return render_template('index.html', latest=file)