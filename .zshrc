autoload -U colors && colors
setopt prompt_subst

# 🌟 कस्टम रंग सेटअप (Sky Blue, Green, Pink, Purple)
USER_COLOR='%F{yellow}'        # यूज़र नाम का रंग  
TERMUX_COLOR='%F{cyan}'        # "Termux" का रंग  
ICON_COLOR='%F{red}👑 🚀%f'    # कस्टम आइकन  
TIME_COLOR='%F{magenta}'       # समय का रंग  
HEART_COLOR='%F{red}❤️%f'      # दिल का रंग  

# 🔥 टॉप बार - टर्मक्स और यूज़र नाम  
PROMPT=$'\n'"%F{blue}┌──[${TERMUX_COLOR}Termux%F{blue}]–{${USER_COLOR} KGshankar %F{blue}}${ICON_COLOR}%f"  
PROMPT+=$'\n%F{blue}│%f'   # **बीच वाली लाइन को सही जगह रखने के लिए कोई एक्स्ट्रा स्पेस नहीं**  

# **मेन प्रॉम्प्ट लाइन**  
PROMPT+=$'\n'"%F{blue}┗–❯%f "  

# 💜 दिल + समय - Pink & Purple  
RPROMPT="${TIME_COLOR}⚡${HEART_COLOR} $(date "+%I:%M:%S %p")%f"  

# 🔹 कर्सर रंग बदलने का फंक्शन  
function change_cursor_color {
    echo -ne '\e]12;2\a'  # कर्सर रंग को 'Green' पर सेट करें  
}

# हर बार प्रॉम्प्ट के पहले कर्सर रंग बदलने के लिए  
precmd_functions+=(change_cursor_color)

# Oh My Zsh और Plugins लोड करें  
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"

# 💾 ऑटो-Completion & सिंटैक्स हाइलाइटिंग  
autoload -U compinit && compinit -u
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zstyle ':completion:*' menu select

# 🔧 टर्मिनल में कस्टम सेटिंग्स  
export TERM="xterm-256color"
