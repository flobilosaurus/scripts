function branch --wraps=git\ checkout\ \(git\ fetch\ -a\ \&\&\ git\ branch\ -av\ \|\ fzf\ \|\ awk\ \'\{\n\ \ \ \ \ \ if\ \(\$0\ \~\ /remotes/\ \)\ \{\n\ \ \ \ \ \ \ \ split\(\$1,a,\"remotes/origin/\"\)\;\n\ \ \ \ \ \ \ \ print\ a\[2\]\n\ \ \ \ \ \ \}\n\ \ \ \ \ \ else\n\ \ \ \ \ \ \ \ print\ \$1\n\ \ \ \ \ \ \}\'\) --description alias\ branch=git\ checkout\ \(git\ fetch\ -a\ \&\&\ git\ branch\ -av\ \|\ fzf\ \|\ awk\ \'\{\n\ \ \ \ \ \ if\ \(\$0\ \~\ /remotes/\ \)\ \{\n\ \ \ \ \ \ \ \ split\(\$1,a,\"remotes/origin/\"\)\;\n\ \ \ \ \ \ \ \ print\ a\[2\]\n\ \ \ \ \ \ \}\n\ \ \ \ \ \ else\n\ \ \ \ \ \ \ \ print\ \$1\n\ \ \ \ \ \ \}\'\)
  git checkout (git fetch -a && git branch -av | fzf | awk '{
      if ($0 ~ /remotes/ ) {
        split($1,a,"remotes/origin/");
        print a[2]
      }
      else
        print $1
      }') $argv; 
end
