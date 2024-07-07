local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-S-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-S-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-S-s>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-S-n>", function()
	harpoon:list():select(4)
end)
