# Defined in - @ line 1
function tg:clean --wraps=find\ .\ -type\ d\ -name\ \".terragrunt-cache\"\ -prune\ -exec\ rm\ -rf\ \{​​\}​​\ \\\; --wraps=find\ .\ -type\ d\ -name\ \".terragrunt-cache\"\ -prune\ -exec\ rm\ -rf\ \{\}\ \\\; --description alias\ tg:clean=find\ .\ -type\ d\ -name\ \".terragrunt-cache\"\ -prune\ -exec\ rm\ -rf\ \{\}\ \\\;
  find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \; $argv;
end
