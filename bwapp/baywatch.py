from flask import Flask, render_template, jsonify, request
import os


app = Flask(__name__)


@app.route("/giflist")
def giflist():
	# how many files to return
	RETURN_NO = 5

	files = os.listdir("static/archive")
	files.sort()

	# ignore rejects and latest.mp4
	files = files[:-2]
	
	# split /static/archive/ from request
	curr = request.args.get('a', "", type=str).split("/")[-1]

	# calculate request array start/end positions
	try:
		i = files.index(curr)
		start_pos = (i - RETURN_NO) % RETURN_NO

	# default to latest if file not found
	except:
		i = len(files)
		start_pos = i - RETURN_NO

	# add back static/archive to file names, and serve
	data = map(lambda x: "static/archive/" + x, files[start_pos:i])
	return jsonify(result=list(data))

@app.route("/")
def baywatch():
	return render_template('index.html')
