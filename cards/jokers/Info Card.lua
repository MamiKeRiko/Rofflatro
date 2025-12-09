SMODS.Joker{
	key = 'infocard',
	atlas = 'roffers',
	rarity = 1,
	cost = 4,
	blueprint_compat = true,
	pos = { x = 1, y = 10 },
	soul_pos = { x = 0, y = 10 },
	config = { extra = {
			chips = 0,
			chip_gain = 2
		}
	},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips, card.ability.extra.chip_gain}}
	end,
	calculate = function(self,card,context)
		if context.card_added and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
			return {
				message = localize('k_upgrade_ex')
			}
		end
		if context.joker_main then
			return{
				chips = card.ability.extra.chips
			}
		end
	end,
    set_badges = function (self, card, badges)
        badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
        badges[#badges+1] = create_badge(localize('k_roff_credit_l6_code'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
    end
}
