import os
import zipfile

# Mappestruktur
folders = [
    "SOVEREIGN-REGISTRY-ZIP/schema",
    "SOVEREIGN-REGISTRY-ZIP/backend/routes",
    "SOVEREIGN-REGISTRY-ZIP/backend/db",
    "SOVEREIGN-REGISTRY-ZIP/frontend"
]

files = {
    "SOVEREIGN-REGISTRY-ZIP/README.txt": "Velkommen til House of Grønli Sovereign Registry.",
    "SOVEREIGN-REGISTRY-ZIP/schema/neo4j_schema.cypher": "// Cypher schema kommer her...",
    "SOVEREIGN-REGISTRY-ZIP/schema/sql_schema.sql": "-- SQL schema kommer her...",
    "SOVEREIGN-REGISTRY-ZIP/schema/dapper_entities.cs": "// C# entities kommer her...",
    "SOVEREIGN-REGISTRY-ZIP/schema/seed_data.sql": "-- Seed data her...",
    "SOVEREIGN-REGISTRY-ZIP/backend/index.js": "// Node.js app entrypoint",
    "SOVEREIGN-REGISTRY-ZIP/backend/routes/registry.js": "// Express routes her...",
    "SOVEREIGN-REGISTRY-ZIP/backend/db/connection.js": "// DB connection config",
    "SOVEREIGN-REGISTRY-ZIP/frontend/SovereignDashboard.html": "<html><body>Dashboard</body></html>",
    "SOVEREIGN-REGISTRY-ZIP/frontend/style.css": "body { font-family: sans-serif; }",
    "SOVEREIGN-REGISTRY-ZIP/frontend/app.js": "console.log('Sovereign UI Loaded');"
}

# Lag mapper
for folder in folders:
    os.makedirs(folder, exist_ok=True)

# Lag filer
for filepath, content in files.items():
    with open(filepath, "w") as f:
        f.write(content)

# Lag zip
zipf = zipfile.ZipFile("sovereign_registry_pack.zip", 'w', zipfile.ZIP_DEFLATED)
for root, dirs, files in os.walk("SOVEREIGN-REGISTRY-ZIP"):
    for file in files:
        filepath = os.path.join(root, file)
        zipf.write(filepath, arcname=os.path.relpath(filepath, "SOVEREIGN-REGISTRY-ZIP"))
zipf.close()

print("✅ Zip-pakke klar: sovereign_registry_pack.zip")