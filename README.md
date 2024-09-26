# myboxconfig

my current configuration of my shell

configuration:
.vimrc

.zshrc
zsh plugins via [antidote](https://github.com/mattmc3/antidote)

### install antidote

`git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote`
`source ${ZDOTDIR:-~}/.antidote/antidote.zsh`
`antidote load`

other tools:
direnv - https://direnv.net/
aws-cli - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
direnv
[fzf](https://github.com/junegunn/fzf)
[fd](https://github.com/sharkdp/fd)
[bat](https://github.com/sharkdp/bat?tab=readme-ov-file#installation)
[eza](https://github.com/eza-community/eza)
[zoxide](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file)

notes:
install P10K - romkatv/powerlevel10k in antidote

update:
2024/09/24 - Using Lazy Plugin for neovim - `:Lazy` - adding tmux plugin tpm
2023/09/17 - Remove Starship replaced with P10K
