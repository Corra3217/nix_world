{ config, inputs, ... }:
let 
dotfiles_dir = "${config.home.homeDirectory}/nix_world/lines/home/dotfiles";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
snr = "sudo nixos-rebuild ";
etc-flag = " -I nixos-config=/etc/nixos/configuration.nix";
flake-flag = " --flake ~/nix_world/#NixBox --impure";
configs = {
  alacritty = "alacritty";
  fastfetch = "fastfetch";
  rofi = "rofi";
  hypr = "hypr";
  qtile = "qtile";
  xfce = "xfce4";
};
in
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  home = {
    username = "nixuser";
    homeDirectory = "/home/nixuser";
    stateVersion = "25.11";
  };

  xdg.configFile =
    builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles_dir}/${subpath}";
        recursive = true;
        }) configs;

  home.file =
    builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles_dir}/${subpath}";
        }) {
      ".vimrc" = "vim/vimrc";
    };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        cde = "cd /etc/nixos && su";
        rebuild = snr + "switch" + etc-flag;
        redo = snr + "boot" + etc-flag + " && reboot";
        test = snr + "test" + etc-flag;

        cdf = "cd ~/nix_world/lines/";
        rebuildf = snr + "switch" + flake-flag;
        redof = snr + "boot" + flake-flag + " && reboot";
        testf = snr + "test" + flake-flag;

# needs those ports open
        giveEthernet = "nmcli connection show && 
          nmcli connection modify \"Wired connection 1\" 
          ipv4.method shared && 
          nmcli connection modify \"Wired connection 1\" 
          ipv6.method ignore && 
          nmcli connection down \"Wired connection 1\" && 
          nmcli connection up \"Wired connection 1\"";
      };
    };

    nixvim = {
      enable = true;

# =========================
# OPTIONS (vim.opt)
# =========================
      opts = {
        number = true;
        relativenumber = true;
        ruler = true;
        smartcase = true;
        hlsearch = true;
        incsearch = true;
        showmatch = true;
        smarttab = true;
        linebreak = true;
        textwidth = 160;
        autoindent = true;
        smartindent = true;
        wrap = true;
        laststatus = 2;
        backspace = [ "indent" "eol" "start" ];
        colorcolumn = "80";

        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;

        cursorline = true;
        cursorlineopt = "number";
      };

# =========================
# KEYMAPS
# =========================
      keymaps = [
# insert pairs
      { mode = "i"; key = "{"; action = "{<CR>}<Esc>ko"; }
      { mode = "i"; key = "("; action = "()<Esc>ha"; }
      { mode = "i"; key = "["; action = "[]<Esc>ha"; }
      { mode = "i"; key = "\""; action = "\"\"<Esc>ha"; }
      { mode = "i"; key = "'"; action = "''<Esc>ha"; }
      { mode = "i"; key = "`"; action = "``<Esc>ha"; }

# tab navigation
      { mode = "n"; key = "<C-Tab>"; action = ":tabnext<CR>"; }
      { mode = "n"; key = "<C-S-Tab>"; action = ":tabprevious<CR>"; }
      { mode = "n"; key = "<C-t>"; action = ":tabnew<CR>"; }

      { mode = "i"; key = "<C-Tab>"; action = "<Esc>:tabnext<CR>i"; }
      { mode = "i"; key = "<C-S-Tab>"; action = "<Esc>:tabprevious<CR>i"; }
      { mode = "i"; key = "<C-t>"; action = "<Esc>:tabnew<CR>i"; }

# LSP keys
      { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<CR>"; }
      { mode = "n"; key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<CR>"; }
      { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<CR>"; }
      { mode = "n"; key = "<leader>rn"; action = "<cmd>lua vim.lsp.buf.rename()<CR>"; }
      ];


       colorschemes.vscode.enable = true;
# =========================
# PLUGINS (replacement for lazy.nvim)
# =========================
      plugins = {

        lsp = {
          enable = true;

          servers = {
            clangd.enable = true;
            tsserver.enable = true;
            nil_ls.enable = true;
          };
        };

        cmp = {
          enable = true;

          settings = {
            mapping = {
              "<Tab>" = "cmp.mapping.select_next_item()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
            };

            sources = [
            { name = "nvim_lsp"; }
            ];
          };
        };
      };

# =========================
# LUA (for things Nixvim doesn't expose cleanly)
# =========================
      extraConfigLua = ''
        -- syntax highlighting
        vim.cmd([[
            syntax enable
            filetype plugin indent on
        ]])

        -- restore cursor position
        vim.api.nvim_create_autocmd("BufReadPost", {
            pattern = "*",
            callback = function()
            local mark = vim.fn.line("'\"")
            if mark > 1 and mark <= vim.fn.line("$") then
            vim.cmd([[normal! g'"]])
            end
            end
            })

      -- highlight tweaks
        vim.cmd("colorscheme vscode")
        vim.cmd("highlight Comment gui=italic")
        vim.cmd("highlight Function gui=bold")
        vim.cmd("highlight Keyword gui=bold")
        '';
    };
  };
}
