local M = {}

function M.filter_quickfix_exclude_suffixes()
    -- Prompt for suffixes
    local suffixes_input = vim.fn.input('Enter suffixes to exclude (comma-separated): ')
    vim.notify("Filter quickfix input received: " .. suffixes_input, vim.log.levels.INFO)

    -- Split input into table
    local suffixes = vim.split(suffixes_input, ',')
    for i, suffix in ipairs(suffixes) do
        suffixes[i] = vim.trim(suffix)
    end
    vim.notify("Parsed suffixes: " .. vim.inspect(suffixes), vim.log.levels.DEBUG)
    
    -- Get and filter quickfix list
    local qflist = vim.fn.getqflist()
    vim.notify("Original quickfix list size: " .. #qflist, vim.log.levels.DEBUG)
    local filtered_qflist = {}
    
    for _, item in ipairs(qflist) do
        local ext = vim.fn.fnamemodify(vim.fn.bufname(item["bufnr"]), ':e')
        if not vim.tbl_contains(suffixes, ext) then
            table.insert(filtered_qflist, item)
        end
    end
    
    -- Set filtered list
    vim.fn.setqflist(filtered_qflist)
end

return M

