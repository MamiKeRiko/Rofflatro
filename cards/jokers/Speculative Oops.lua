SMODS.Joker{
	key = 'spec_oops',
	atlas = 'roffers',
	rarity = 2,
	cost = 3,
	eternal_compat = true,
	pos = { x = 1, y = 6 },
	config = { extra = { dollars = 16, odds = 2 } },
	loc_vars = function(self,info_queue,card)
		return {vars = {G.GAME.probabilities.normal^4 or 1, card.ability.extra.odds, card.ability.extra.dollars}}
	end,
	calc_dollar_bonus = function(self, card)
		if pseudorandom('roff_spec_oops') <= (G.GAME.probabilities.normal)^4 / (card.ability.extra.odds)^4 then
			return card.ability.extra.dollars
		else
			SMODS.calculate_context({roff_probability_missed = true}, effects)
			SMODS.calculate_context({roff_probability_missed = true}, effects)
			SMODS.calculate_context({roff_probability_missed = true}, effects)
			SMODS.calculate_context({roff_probability_missed = true}, effects)
		end
	end,
	set_badges = function (self, card, badges)
		badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
		badges[#badges+1] = create_badge(localize('k_roff_credit_canicao_code'), ROFF.C.credits.canicao, ROFF.C.credits.canicao_text, 0.8)
	end
}
