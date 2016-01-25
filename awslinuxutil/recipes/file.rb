

# Sample of manage a file

cookbook_file "/data/test-file-recipe.txt" do
  source "test-file-recipe.txt"
  mode "0644"
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "index.html"
  mode "0644"
end