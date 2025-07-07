SMODS.Joker{
   key = 'in_n_out',
   atlas = 'roffers',
   rarity = 1,
   cost = 4,
   blueprint_compat = true,
   eternal_compat = true,
	perishable_compat = false,
   pos = { x = 1, y = 2 },
   config = {
      extra = {
         chips = 0,
         chip_mod = 30,
         check = true
      }
   },
   loc_vars = function(self, info_queue, card)
      return {
         vars = { card.ability.extra.chip_mod, card.ability.extra.chips }
      }
   end,
   calculate = function(self, card, context)
   if context.reroll_shop and card.ability.extra.check == true and not context.blueprint then
      card.ability.extra.check = false
      return {
         message = localize('k_roff_inout_fail'),
         colour = G.C.RED,
         sound = 'cancel'
      }
   end
   if context.ending_shop and not context.blueprint then
      if card.ability.extra.check == true then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
      return {
         message = localize('k_upgrade_ex'),
         colour = G.C.CHIPS,
         sound = 'chips2'
      }
      else
         card.ability.extra.check = true
      end
   end
   if context.joker_main then
      return {
         chips = card.ability.extra.chips,
         }
      end
   end,
   set_badges = function (self, card, badges)
 	    badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
	    badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
	 end
}
