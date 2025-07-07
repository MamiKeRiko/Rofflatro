--o7 (Rare) - If final hand of round scores 50% of total score but doesn't win, prevents death and gives 20$. Self destructs. (False alarm guys!)

SMODS.Joker{
	key = 'o7',
	atlas = 'roffers',
	rarity = 3,
	cost = 7,
	blueprint_compat = false,
	eternal_compat = false,
	pos = { x = 2, y = 5 },
	config = { extra = {
		dollars = 20,
		}
	},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.dollars}}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and not context.blueprint and context.game_over and  G.GAME.chips/G.GAME.blind.chips >= 0.5 then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.hand_text_area.blind_chips:juice_up()
					G.hand_text_area.game_chips:juice_up()
					play_sound('tarot1')
					card:start_dissolve()
					return true
				end
			})) 
			return {
				message = 'Put that away!',
				saved = "k_roff_o7_saved",
				colour = G.C.RED,
				dollars = card.ability.extra.dollars
			}

		end
	end,
	set_badges = function (self, card, badges)
		badges[#badges+1] = create_badge(localize('k_roff_credit_uhadme_art'), ROFF.C.credits.uhadme, G.C.WHITE, 0.8)
		badges[#badges+1] = create_badge(localize('k_roff_credit_uhadme_code'), ROFF.C.credits.uhadme, G.C.WHITE, 0.8)
	end
}
