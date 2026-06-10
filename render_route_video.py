import os
import sys
from moviepy.editor import ColorClip, TextClip, CompositeVideoClip

# Shared route data synchronized with frontend database
ROUTES = {
    "Goa": {"from": [77.5510, 28.5519], "to": [74.1240, 15.2993], "distance": "1,540 km"},
    "Manali": {"from": [77.5510, 28.5519], "to": [77.1887, 32.2396], "distance": "580 km"},
    "Kerala": {"from": [77.5510, 28.5519], "to": [76.2711, 10.8505], "distance": "2,250 km"},
    "Rajasthan": {"from": [77.5510, 28.5519], "to": [74.2179, 27.0238], "distance": "480 km"},
    "Andaman Islands": {"from": [77.5510, 28.5519], "to": [92.6586, 11.7401], "distance": "2,490 km"},
    "Dubai": {"from": [77.5510, 28.5519], "to": [55.2708, 25.2048], "distance": "2,185 km"},
}

def build_video(destination_name):
    if destination_name not in ROUTES:
        print(f"Error: Destination '{destination_name}' not found in route data.")
        sys.exit(1)
        
    route = ROUTES[destination_name]
    print(f"Generating travel route video for: {destination_name}...")
    
    # Create the background clip (8 seconds duration, 1080p)
    base = ColorClip(size=(1920, 1080), color=(15, 23, 42), duration=8)
    
    # Title overlay
    title = TextClip(
        f"YumeTrips Journey — {destination_name}",
        fontsize=64,
        color="#38bdf8",
        font="Arial-Bold"
    ).set_position(("center", 250)).set_duration(8)
    
    # Route description
    route_info = TextClip(
        f"Route: Dādri, UP, India ──✈  {destination_name}",
        fontsize=40,
        color="#ffffff",
        font="Arial"
    ).set_position(("center", 400)).set_duration(8)
    
    # Distance overlay
    distance_info = TextClip(
        f"Estimated Travel Distance: {route['distance']}",
        fontsize=36,
        color="#a7f3d0",
        font="Arial-Italic"
    ).set_position(("center", 500)).set_duration(8)
    
    # Subtitle overlay
    subtitle = TextClip(
        "Animated route video rendering...",
        fontsize=28,
        color="#64748b",
        font="Arial"
    ).set_position(("center", 850)).set_duration(8)
    
    # Compose all clips
    final = CompositeVideoClip([base, title, route_info, distance_info, subtitle])
    
    output_filename = f"{destination_name.lower().replace(' ', '_')}_route.mp4"
    print(f"Writing video file to: {output_filename}...")
    final.write_videofile(output_filename, fps=24, codec="libx264", audio=False)
    print("Video generation completed successfully! 🎉")

if __name__ == "__main__":
    dest = sys.argv[1] if len(sys.argv) > 1 else "Dubai"
    build_video(dest)
