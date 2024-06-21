import pygraphviz as pgv

# Create a new graph
G = pgv.AGraph(strict=False, directed=True)

# Add entities to the graph
entities = {
    "User": ["namaUser: PK", "email", "password", "address", "phone"],
    "Charity": ["NamaCharity: PK", "TargetDonasi", "TotalDonasi", "jumlahLike"],
    "Donation": ["DonationID: PK", "UserID: FK", "NamaCharity: FK", "JumlahDonasi"],
    "Comment": ["CommentID: PK", "UserID: FK", "NamaCharity: FK", "IsiKomentar", "TanggalKomentar"],
    "Like": ["LikeID: PK", "UserID: FK", "NamaCharity: FK", "TanggalLike"],
    "News": ["idNews: PK", "namaNews", "tanggalNews"]
}

# Add entities as nodes
for entity, attributes in entities.items():
    attributes_str = "\n".join(attributes)
    G.add_node(entity, shape='record', label=f"{{ {entity} | {attributes_str} }}")

# Add relationships as edges
relationships = [
    ("User", "Charity", "One-to-Many"),
    ("User", "Donation", "One-to-Many"),
    ("Charity", "Donation", "One-to-Many"),
    ("User", "Comment", "One-to-Many"),
    ("Charity", "Comment", "One-to-Many"),
    ("User", "Like", "One-to-Many"),
    ("Charity", "Like", "One-to-Many")
]

for relation in relationships:
    G.add_edge(relation[0], relation[1], label=relation[2])

# Generate CDM diagram
G.layout(prog='dot')
G.draw('CDM.png')

# Generate PDM diagram
# For PDM, you might want to include data types, primary keys, foreign keys, etc.
# This example is simplified for demonstration purposes
# You can enhance it by adding more details as needed.

# Create a new graph for PDM
G_pdm = pgv.AGraph(strict=False, directed=True)

# Add entities as nodes with additional details
for entity, attributes in entities.items():
    attributes_str = "\n".join(attributes)
    G_pdm.add_node(entity, shape='record', label=f"{{ {entity} | {attributes_str} }}")

# Define data types and keys
data_types = {
    "User": "table",
    "Charity": "table",
    "Donation": "table",
    "Comment": "table",
    "Like": "table",
    "News": "table"
}

keys = {
    "User": "PK",
    "Charity": "PK",
    "Donation": "PK",
    "Comment": "PK",
    "Like": "PK",
    "News": "PK"
}

# Add entities with data types and keys
for entity, attributes in entities.items():
    attributes_str = "\n".join(attributes)
    data_type = data_types.get(entity, "table")
    key = keys.get(entity, "")
    G_pdm.add_node(entity, shape='record', label=f"{{ {entity} | {attributes_str} | Type: {data_type} | Key: {key} }}")

# Add relationships as edges
for relation in relationships:
    G_pdm.add_edge(relation[0], relation[1], label=relation[2])

# Generate PDM diagram
G_pdm.layout(prog='dot')
G_pdm.draw('PDM.png')
