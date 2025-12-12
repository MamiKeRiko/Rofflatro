local applyToRun = Card.apply_to_run
function Card:apply_to_run(center)
   G.GAME.ROFF_vouchers_redeemed = (G.GAME.ROFF_vouchers_redeemed or 0) + 1
   applyToRun(self, center)
end

SMODS.Voucher:take_ownership('blank',
   {
   redeem = function(self, card)
      G.GAME.ROFF_blanks_obtained = G.GAME.ROFF_blanks_obtained + 1
   end,
   },
   true
)

SMODS.Voucher {
   key = 'coupon',
   atlas = 'rauchers',
   pos = { x = 0, y = 0 },
   config = { extra = { mult = 10 } },
   unlocked = true,
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.mult } }
   end,
   calculate = function(self, card, context)
      if context.joker_main then
         return {
            mult_mod = card.ability.extra.mult * G.GAME.ROFF_vouchers_redeemed,
            sound = 'multhit1'
         }
      end
   end,
   set_badges = function (self, card, badges)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_art'), ROFF.C.credits.canicao_text, ROFF.C.credits.canicao, 0.8)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
   end
}

SMODS.Voucher {
   key = 'blanket',
   atlas = 'rauchers',
   pos = { x = 0, y = 1 },
   config = { extra = { Xmult = 2 } },
   unlocked = true,
   requires = {'v_roff_coupon'},
   loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.Xmult } }
   end,
   calculate = function(self, card, context)
      if context.joker_main then
         return {
            Xmult_mod = card.ability.extra.Xmult ^ G.GAME.ROFF_blanks_obtained,
            sound = 'multhit2'
         }
      end
   end,
   in_pool = function(self, args)
      local list = ROFF.funcs.table_shallow_copy(G.P_CENTER_POOLS.Voucher)
      for i = 1, #list do
         if G.GAME.used_vouchers[list[i].key] or list[i].key == 'v_roff_blanket' then
            list[i] = true
            goto skip
         end
         if not list[i].requires then
            goto skip
         end
         for j = 1, #list[i].requires do
            if G.GAME.ROFF_vouchers_sliced_list[list[i].requires[j]] then
               list[i] = true
            end
         end
         ::skip::
         if list[i] ~= true then
            return false
         end
         return true
      end
   end,
   set_badges = function (self, card, badges)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_art'), ROFF.C.credits.canicao_text, ROFF.C.credits.canicao, 0.8)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
   end
}

SMODS.Voucher {
   key = 'deckfixer',
   atlas = 'rauchers',
   pos = { x = 1, y = 0 },
   unlocked = true,
   loc_vars = function (self, info_queue, card)
      info_queue[#info_queue+1] = {key = 'roff_favorite', set = 'Other'}
   end,
   set_badges = function (self, card, badges)
      badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
   end
}

SMODS.Booster:take_ownership_by_kind('Standard', {
   create_card = function(self, card, i)
      local playing
      if G.GAME.used_vouchers.v_roff_deckfixer and i == 1 then
         local pool = {}
         for j = 1, #G.playing_cards do
            if G.playing_cards[j].ability.roff_favorite then
               pool[#pool + 1] = G.playing_cards[j]
            end
         end
         if #pool > 0 then 
            playing = copy_card(pseudorandom_element(pool, pseudoseed('roff_favorite')), nil)
         else
            playing = create_card((pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base", G.pack_cards, nil, nil, nil, true, nil, 'sta')
            playing:set_edition(poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, true))
            if pseudorandom(pseudoseed('seal')) > 0.8 then
               card:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'sta' }))
            end
         end
      else
         playing = create_card((pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base", G.pack_cards, nil, nil, nil, true, nil, 'sta')
         playing:set_edition(poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, true))
         if pseudorandom(pseudoseed('seal')) > 0.8 then
            card:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'sta' }))
         end
      end
      return playing
   end
}, true)

SMODS.Voucher {
   key = 'deckstuffer',
   atlas = 'rauchers',
   pos = { x = 1, y = 1 },
   unlocked = true,
   requires = {'v_magic_trick', 'v_roff_deckfixer'},
   loc_vars = function (self, info_queue, card)
      info_queue[#info_queue+1] = {key = 'roff_favorite', set = 'Other'}
   end,
   set_badges = function (self, card, badges)
      badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
   end
}
