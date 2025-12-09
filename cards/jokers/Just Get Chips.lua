SMODS.Joker{
	key = 'getchips',
	atlas = 'roffers',
	rarity = 3,
	cost = 6,
	blueprint_compat = false,
	eternal_compat = true,
	pos = { x = 1, y = 7 },
	soul_pos = { x = 0, y = 7 },
	config = { extra = {active = false}},
	calculate = function(self,card,context)

		if context.setting_blind then
			card.ability.extra.active = true
			print("getchips active")
		end

		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.active = false
		end

		if card.ability.extra.active then

			local effects = {}

			for _, j in ipairs(G.jokers.cards) do
				if j ~= card then

					context.blueprint = nil
					local ret = SMODS.blueprint_effect(card, j, context)

					if ret then
						local chip_effect = (ret.chip_mod > 0 and ret.chip_mod) or ret.chips
						if chip_effect then
							print(j.ability.name .. " gives " .. chip_effect .. " chips")
							table.insert(effects, {chips = chip_effect, card = j})
						end
					end
				end
			end

			return SMODS.merge_effects(effects)
		end
	end,
	add_to_deck = function (self, card, from_debuff)
		if G.STATE == G.STATES.SELECTING_HAND then -- for judgement
			card.ability.extra.active = true
		end
	end,
	set_badges = function (self, card, badges)
		badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
		badges[#badges+1] = create_badge(localize('k_roff_credit_l6_code'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
	end
}
