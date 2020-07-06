from flask import Flask, Response, request

import json
app = Flask(__name__)


@app.route('/')
def hello_world():
	return Response(json.dumps({'data':{'name': request.args.get('name', 'nothing?')}}), content_type='application/json')


if __name__ == '__main__':
	app.run(debug=True)