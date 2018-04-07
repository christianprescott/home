function pretty_now() {
  date +'%H:%M:%S'
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STATUS=""
		git diff --exit-code --quiet
		if [ ! "$?" == "0" ]
		then
			STATUS="*"
		fi
		echo "[${BRANCH}${STATUS}]"
	else
		echo ""
	fi
}
export PS1="\[\e[33m\]\`pretty_now\` \W \`parse_git_branch\`\[\e[m\]\\$ "

# Aliases
alias be="bundle exec"
alias dc="docker-compose"
alias dcr="docker-compose run --rm"
alias dps="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.Size}}\t{{.ID}}\" | sort"
alias ppjson="python -m json.tool"
alias lfr="less +F -R"

