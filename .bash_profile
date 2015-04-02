# --------------------
# Ruby Version Manager
# --------------------
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#---------------------------
# Z
#---------------------------
[[ -s /usr/local/z/z.sh ]] && . /usr/local/z/z.sh
# ------------------------------------------------------------------------
# load ~/.bash_prompt, ~/.bash_function, ~/.bash_aliases, ~/.bash_exports
# ------------------------------------------------------------------------
for file in ~/.{bash_prompt,aliases,functions,exports}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;
