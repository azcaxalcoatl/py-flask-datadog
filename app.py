#!/usr/bin/env python3
"""A simple API using Flask to test Datadog instrumentation.

Execution:
    python3 app.py
    or
    ./app.py

"""

from flask import Flask
from routes import initialize_routes

app = Flask(__name__)
initialize_routes(app)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')