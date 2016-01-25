# Sample of execute a command
execute "touch file" do
  command "touch /data/test-command-recipe.txt"
end


execute "adding date" do
  command "date >> /data/test-command-recipe.txt"
end

execute "adding text" do
  command "echo \'tested command execution......\'  >> /data/test-command-recipe.txt"
end

