{ ... }:
{
  programs.nixvim = {
    plugins.nvim-autopairs = {
      enable = true;
      settings = {
        event = "InsertEnter";
      };
    };
  };
}
