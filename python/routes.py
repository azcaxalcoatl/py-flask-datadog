from flask import request, jsonify
from players_data import players_data 

def initialize_routes(app):
    @app.route('/get_squad', methods=['GET'])
    def get_squad():
        return jsonify(players_data)
    
    @app.route('/get_player', methods=['POST'])
    def get_player():
        data = request.get_json()
        player_name = data.get('player')
        player = next((p for p in players_data["Player"] if p["Name"].lower() == player_name.lower()), None)
        if player:
            return jsonify(player)
        else:
            return jsonify({"error": "Player not found"}), 404