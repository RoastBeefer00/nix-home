{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ sort-nvim ];

    extraConfigLua = ''
      require("sort").setup({})
    '';
  };
}
