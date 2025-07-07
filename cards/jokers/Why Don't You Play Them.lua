SMODS.Joker {
   key = 'whydontyou',
   atlas = 'roffers',
   pos = { x = 4, y = 9 },
   rarity = 3,
   cost = 10,
   blueprint_compat = true,
   config = { extra = { mult = 2 } },
   loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = {key = 'roff_favorite', set = 'Other'}
      return { vars = { card.ability.extra.mult } }
   end,
   calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and not context.other_card.ability.roff_favorite then
         context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
         return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT
         }
      end
   end,
   set_badges = function(self, card, badges)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_art'), ROFF.C.credits.canicao_text, ROFF.C.credits.canicao, 0.8)
      badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
   end
}
