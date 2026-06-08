# auto loads ==================================================================
autoload -U colors && colors

# completion opts =============================================================
autoload -U compinit && compinit                                    # load cmp
zmodload zsh/complist
zstyle ':completion:*' menu select                                  # tab select
zstyle ':completion:*' squeeze-slashes false                        # allow /*/
zstyle ':completion:*' completer _extensions _complete _approximate # cmp order
zstyle ':completion:*' special-dirs true                            # add . and .. to cmp
zstyle ':completion:*' complete-options true                        # cmp opt for cd
zstyle ':completion:*' file-sort modification                       # sort cmp by modification time
_comp_options+=(globdots)                                           # dots
source <(COMPLETE=zsh jj)                                           # load jj cmp


# main opts ===================================================================
setopt menu_complete              # select first cmp opt
setopt autocd                     # cd without typing cd
setopt auto_param_slash           # add / instead of space when cmp dir name
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots                   # include dotfiles
setopt extended_glob              # more glob options
setopt interactive_comments       # allow comments in shell
setopt auto_pushd                 # push current dir on the stack
setopt pushd_ignore_dups          # don't store dupes in the stack
setopt pushd_silent               # don't print dir stack after pushd / popd
setopt always_to_end              # move cursor to end of completed word
setopt complete_in_word           # complete from both ends of a word

# history opts ================================================================
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh/history"
# append history to HISTFILE, write y to HISTFILE, share history across zsh sessions
setopt append_history inc_append_history share_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_expire_dups_first

# vi mode =====================================================================
bindkey -v
export KEYTIMEOUT=1

# edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd e edit-command-line

# use vim keys in cmp menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#==============================================================================

#yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    command rm -f -- "$tmp"
}
bindkey -s '^e' 'y\n'

source <(fzf --zsh) # C-R history, C-T, files, A-C dir changer 

# mise-en-place
eval "$(mise activate zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# gpg
export GPG_TTY=$(tty)

# fcitx
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export SDL_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"


# prompt with jj integration ==================================================

setopt prompt_subst
autoload -U add-zsh-hook

jj_prompt() {
  name=$(jj log --no-graph -T 'change_id.shortest()' -r @ 2>/dev/null)
  [[ -n "$name" ]] || { JJ=""; return }
  [[ -n $(jj diff --stat 2>/dev/null) ]] && dirty="*" || dirty=""
  main=$(jj log --no-graph -T 'local_bookmarks.map(|b| b.name()).join(",")' -r @ 2>/dev/null)
  [[ "$main" == *"main"* ]] && main=" main" || main=""
  JJ="%F{#262626}[$name$dirty$main]%f"
}

add-zsh-hook precmd jj_prompt
PROMPT=$'${JJ} %F{#393939}%~\n|%f '

# source ======================================================================
source ~/.config/zsh/aliases
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
