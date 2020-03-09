#!/usr/bin/env node
let ccxt = require('ccxt')

new ccxt.kraken().fetch_markets().then(function(markets) {
  var products = []

  var products = markets.map(function (market) {
    return {
      id: market.id,
      asset: market.base,
      currency: market.quote,
      min_size: market.limits.amount.min,
      increment: market.limits.price.min,
      label: market.base + '/' + market.quote
    }
  })

  var target = require('path').resolve(__dirname, 'products.json')
  require('fs').writeFileSync(target, JSON.stringify(products, null, 2))
  console.log('wrote', target)
  process.exit()
})
