{ ... }:
{
  programs.nixvim = {
    plugins.hop = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>H";
        action = "<cmd>HopWord<cr>";
      }
    ];
  };
}
