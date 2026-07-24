-- 2. Плагин, который изолирует буферы внутри этих вкладок
return {
  "tiagovla/scope.nvim",
  config = function()
    require("scope").setup()
  end,
}
