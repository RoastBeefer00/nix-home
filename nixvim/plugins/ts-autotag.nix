{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ nvim-ts-auto-tag ];

    extraConfigLua = ''
      require("nvim-ts-autotag").setup({})
    '';
  };
}
