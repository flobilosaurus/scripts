# Defined via `source`
function set-cluster --wraps=!! --wraps='aws eks --region eu-central-1 update-kubeconfig --name (aws eks --region eu-central-1 list-clusters | jq .clusters[] -r | fzf)' --description 'alias set-cluster=aws eks --region eu-central-1 update-kubeconfig --name (aws eks --region eu-central-1 list-clusters | jq .clusters[] -r | fzf)'
  aws eks --region eu-central-1 update-kubeconfig --name (aws eks --region eu-central-1 list-clusters | jq .clusters[] -r | fzf) $argv; 
end
