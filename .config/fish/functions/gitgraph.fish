# Defined in - @ line 1
function gitgraph --wraps='git log --oneline --graph --decorate --all' --description 'alias gitgraph git log --oneline --graph --decorate --all'
  git log --oneline --graph --decorate --all $argv;
end
