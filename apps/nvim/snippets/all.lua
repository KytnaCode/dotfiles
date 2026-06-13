local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

return {
  s('charsetAlphaLower', { t('abcdefghijklmnopqrstuvwxyz') }),
  s('charsetAlphaUpper', { t('ABCDEFGHIJKLMNOPQRSTUVWXYZ') }),
  s('charsetAlpha', { t('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') }),
  s('charsetAlphanum', { t('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz') }),
  s('charsetBase64', { t('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/') }),
}
