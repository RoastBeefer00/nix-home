{ pkgs, ... }:
{
  imports = [ ./plugins ];

  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };
    plugins.lightline.enable = true;
    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = true;
    };
    opts = {
      # Show line numbers
      expandtab = true;
      number = true;
      # guicursor = "";
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      relativenumber = true;

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the statusline
      showmode = false;
      smartindent = true;

      # Sync clipboard between OS and Neovim
      #  Remove this option if you want your OS clipboard to remain independent.
      #  See `:help 'clipboard'`
      clipboard = "unnamedplus";

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;
      undodir.__raw = "os.getenv('HOME') .. '/.vim/undodir'";

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  See `:help 'listchars'`
      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview subsitutions live, as you type!
      inccommand = "split";
      incsearch = true;
      # termguicolors = true;

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # Set highlight on search, but clear on pressing <Esc> in normal mode
      hlsearch = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>pv";
        action = "vim.cmd.Ex";
      }
      {
        mode = "v";
        key = "J";
        action = ">+1<CR>gv=gv";
        options = {
          desc = "Move line down";
        };
      }
      {
        mode = "v";
        key = "K";
        action = "<-2<CR>gv=gv";
        options = {
          desc = "Move line up";
        };
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          desc = "Page down and center cursor";
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          desc = "Page up and center cursor";
        };
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          desc = "Go to next search and center cursor";
        };
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          desc = "Go to previous search and center cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>ws";
        action = "<cmd>split<CR><C-w><down>";
        options = {
          desc = "Create horizontal split and move to it";
        };
      }
      {
        mode = "n";
        key = "<leader>wv";
        action = "<cmd>vsplit<CR><C-w><right>";
        options = {
          desc = "Create vertical split and move to it";
        };
      }
      {
        mode = "n";
        key = "<leader>wh";
        action = "<C-w><left>";
        options = {
          desc = "Move to left split";
        };
      }
      {
        mode = "n";
        key = "<leader>wj";
        action = "<C-w><down>";
        options = {
          desc = "Move to below split";
        };
      }
      {
        mode = "n";
        key = "<leader>wk";
        action = "<C-w><up>";
        options = {
          desc = "Move to above split";
        };
      }
      {
        mode = "n";
        key = "<leader>wl";
        action = "<C-w><right>";
        options = {
          desc = "Move to right split";
        };
      }
      {
        mode = "n";
        key = "U";
        action = "<C-r>";
        options = {
          desc = "Undo";
        };
      }
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options = {
          desc = "Exit insert mode";
        };
      }
      {
        mode = "n";
        key = "<C-f>";
        action = "vim.lsp.buf.format";
        options = {
          desc = "LSP format";
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action = "o<Esc>k";
        options = {
          desc = "Add blank line below and move cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>O";
        action = "O<Esc>k";
        options = {
          desc = "Add blank line above and move cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Git<CR>";
        options = {
          desc = "Git";
        };
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Git push<CR>";
        options = {
          desc = "Git push";
        };
      }
      {
        mode = "n";
        key = "<leader>ga";
        action = "<cmd>Git add .<CR>";
        options = {
          desc = "Git add all files";
        };
      }
      {
        mode = "n";
        key = "<C-A-h>";
        action.__raw = "require('smart-splits').resize_left";
        options = {
          desc = "Resize split to the left";
        };
      }
      {
        mode = "n";
        key = "<C-A-j>";
        action.__raw = "require('smart-splits').resize_down";
        options = {
          desc = "Resize split down";
        };
      }
      {
        mode = "n";
        key = "<C-A-k>";
        action.__raw = "require('smart-splits').resize_up";
        options = {
          desc = "Resize split up";
        };
      }
      {
        mode = "n";
        key = "<C-A-l>";
        action.__raw = "require('smart-splits').resize_right";
        options = {
          desc = "Resize split to the right";
        };
      }
      {
        mode = "n";
        key = "<C-h>";
        action.__raw = "require('smart-splits').move_cursor_left";
        options = {
          desc = "Move to the left split";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action.__raw = "require('smart-splits').move_cursor_down";
        options = {
          desc = "Move to the below split";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action.__raw = "require('smart-splits').move_cursor_up";
        options = {
          desc = "Move to the above split";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action.__raw = "require('smart-splits').move_cursor_right";
        options = {
          desc = "Move to the right split";
        };
      }
    ];
    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.highlight.on_yank()`
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];
    plugins = {
      # Detect tabstop and shiftwidth automatically
      # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
      sleuth = {
        enable = true;
      };

      # "gc" to comment visual regions/lines
      # https://nix-community.github.io/nixvim/plugins/comment/index.html
      comment = {
        enable = true;
      };

      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments = {
        enable = true;
        signs = true;
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
    extraPlugins = with pkgs.vimPlugins; [
      # Useful for getting pretty icons, but requires a Nerd Font.
      nvim-web-devicons # TODO: Figure out how to configure using this with telescope
    ];

    # TODO: Figure out where to move this
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
    extraConfigLuaPre = ''
      if vim.g.have_nerd_font then
        require('nvim-web-devicons').setup {}
      end
    '';

    # The line beneath this is called `modeline`. See `:help modeline`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
    extraConfigLuaPost = ''
      -- vim: ts=2 sts=2 sw=2 et
    '';
  };
}
