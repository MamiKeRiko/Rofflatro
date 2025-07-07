--Gross Michael (Uncommon) - Creates Gros Michel at end of shop (must have room). 
--Gains x0.25 Mult for each Gros Michel held at end of round. 
--Destroyed with Gros Michel. (Ew! Just DIE already!)

--kidnaps gros michel, credit https://github.com/Steamodded/examples/blob/master/Mods/ExampleJokersMod/ModdedVanilla.lua for the code
SMODS.Joker:take_ownership('gros_michel', -- object key (class prefix not required)
    { -- table of properties to change from the existing object
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end

        -- Checks to see if it's end of round, and if context.game_over is false.
        -- Also, not context.repetition ensures it doesn't get called during repetitions.
        if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            -- Another pseudorandom thing, randomly generates a decimal between 0 and 1, so effectively a random percentage.
            if pseudorandom('gros_michel') < G.GAME.probabilities.normal / card.ability.extra.odds then
                --custom context to check if a gros michel has died
                SMODS.calculate_context({
                    roff_dead_michel = true
                })
                -- This part plays the animation.
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        -- This part destroys the card.
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end
                }))
                -- Sets the pool flag to true, meaning Gros Michel doesn't spawn, and Cavendish does.
                G.GAME.pool_flags.gros_michel_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                SMODS.calculate_context({roff_probability_missed = true}, effects)
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end
    },
    true -- silent | suppresses mod badge
)

SMODS.Joker{
    key = 'grossmichael',
    atlas = 'roffers',
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = { x = 5, y = 2 },
    config = { extra = { Xmult = 1, Xmult_mod = 0.2, do_gross_calc = true} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_gros_michel
        return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult}}
    end,
    calculate = function (self, card, context)
        if context.ending_shop then
            card.ability.extra.do_gross_calc = true
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({key='j_gros_michel'})
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))
                return {
                    message = localize('k_roff_gross_add_banana'),
                    colour = HEX('4d502a')
                }
            end
        elseif context.end_of_round and context.cardarea and card.ability.extra.do_gross_calc and not context.blueprint then
            local Michaels = SMODS.find_card('j_gros_michel',true)
            card.ability.extra.Xmult = card.ability.extra.Xmult + (card.ability.extra.Xmult_mod * #Michaels)
            card.ability.extra.do_gross_calc = false
            return {
                message = localize('k_upgrade_ex')
            }
        elseif context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.roff_dead_michel and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    -- This part destroys the card.
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true;
                        end
                    }))
                    return true
                end
            }))
            -- Sets the pool flag to true, meaning Gros Michel 2 doesn't spawn, and Cavendish 2 does.
            SMODS.calculate_context({
                roff_dead_michel = false
            })
            return {
                message = localize('k_roff_gross_dead')
            }
        end
    end,
    set_badges = function (self, card, badges)
        badges[#badges+1] = create_badge(localize('k_roff_credit_l6_art'), ROFF.C.credits.Lucky6, G.C.WHITE, 0.8)
        badges[#badges+1] = create_badge(localize('k_roff_credit_uhadme_code'), ROFF.C.credits.uhadme, G.C.WHITE, 0.8)
    end
}
