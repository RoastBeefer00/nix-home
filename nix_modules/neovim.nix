# {
#     programs.nixvim = {
#         enable = true;
#
#         colorschemes.catppuccin = {
#             enable = true;
#             settings = {
#                 flavour = "mocha";
#             }
#         }
#     }
# }
{ pkgs, ... }:
{

  programs.neovim = {
    enable = false;
    defaultEditor = true;
    extraPackages = [
      pkgs.bash-language-server
      pkgs.clippy
      pkgs.goimports-reviser
      pkgs.golines
      pkgs.gopls
      pkgs.gosimports
      pkgs.htmx-lsp
      pkgs.lua-language-server
      pkgs.luaformatter
      pkgs.marksman
      pkgs.nil
      pkgs.nixfmt-rfc-style
      pkgs.nodePackages.dockerfile-language-server-nodejs
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      # pkgs.nodePackages.vscode-html-languageserver-bin
      # pkgs.nodePackages.vscode-json-languageserver-bin
      pkgs.prettierd
      pkgs.pyright
      pkgs.rust-analyzer
      pkgs.rustfmt
      pkgs.svelte-language-server
      pkgs.tailwindcss-language-server
      pkgs.templ
      pkgs.terraform-ls
      pkgs.vim-language-server
      pkgs.yaml-language-server
    ];
  };
}
