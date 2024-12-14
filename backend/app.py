from flask import Flask, jsonify

app = Flask(__name__)

# Route for root URL
@app.route('/', methods=['GET'])
def home():
    return "Welcome to the Flask Backend!"

# Route for API
@app.route('/api/data', methods=['GET'])
def get_data():
    return jsonify({"message": "Hello from Flask Backend!"})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
