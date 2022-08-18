json.extract! paper, :id, :title, :author, :publication_year, :created_at, :updated_at
json.url paper_url(paper, format: :json)
